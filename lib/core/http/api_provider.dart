import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../constant/end_points.dart';
import '../errors/base_error.dart';
import '../errors/connection_error.dart';
import 'http_method.dart';

class ApiProvider {
  static var options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: kIsWeb ? 0 : 30000,
    receiveTimeout: kIsWeb ? 0 : 30000,
  );
  static final Dio dio = Dio(options);

  static Future<Either<BaseError, BaseModel>> sendObjectRequest<BaseModel>({
    required HttpTypeMethod method,
    required String url,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    required BaseModel Function(Map<String, dynamic>) converter,
  }) async {
    try {
      debugPrint('[$method: $url] data : [$data]');
      debugPrint('queryParameters : [$queryParameters]');

      dio.options.headers = headers;

      debugPrint(jsonEncode(data)); //CONVERT DATA TO STRING

      Response response;
      switch (method) {
        case HttpTypeMethod.get:
          response = await dio.get(
            url,
            queryParameters: queryParameters,
          );
          break;
        case HttpTypeMethod.post:
          response = await dio.post(
            url,
            data: data,
            queryParameters: queryParameters ?? {},
          );
          break;
        case HttpTypeMethod.put:
          response = await dio.put(
            url,
            data: data,
            queryParameters: queryParameters,
          );
          break;
        case HttpTypeMethod.delete:
          response = await dio.delete(
            url,
            data: data,
            queryParameters: queryParameters,
          );
          break;
      }

      // Get the decoded json
      var decodedJson;

      if (response.data is String) {
        debugPrint(response.toString());
        decodedJson = json.decode(response.data);
        debugPrint(decodedJson);
      } else {
        decodedJson = response.data;
      }

      if (decodedJson['result'] == false || decodedJson['result'] == true) decodedJson['result'] = {'': ''};

      if ((response.statusCode)! > 199 && (response.statusCode)! < 300) {
        if (decodedJson != null) {
          /// Todo check for model json
          return Right(converter(decodedJson));
        } else {
          return Left(ConnectionError());
        }

        // Return the http response with actual data
      } else {
        return Left(ConnectionError());
      }
    }

    // Handling errors
    on DioError catch (e) {
      return Left(ConnectionError());
    }

    // Couldn't reach out the server
    on SocketException catch (e, _) {
      return Left(ConnectionError());
    }
  }

  static Future<Either<Exception, List<BaseModel>>> sendListRequest<BaseModel>({
    required HttpTypeMethod method,
    required String url,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    required BaseModel Function(Map<String, dynamic>) converter,
  }) async {
    try {
      debugPrint('[$method: $url] data : [$data]');
      debugPrint('queryParameters : [$queryParameters]');

      dio.options.headers = headers;

      debugPrint(jsonEncode(data)); //CONVERT DATA TO STRING

      Response response;
      switch (method) {
        case HttpTypeMethod.get:
          response = await dio.get(
            url,
            queryParameters: queryParameters,
          );
          break;
        case HttpTypeMethod.post:
          response = await dio.post(
            url,
            data: data,
            queryParameters: queryParameters ?? {},
          );
          break;
        case HttpTypeMethod.put:
          response = await dio.put(
            url,
            data: data,
            queryParameters: queryParameters,
          );
          break;
        case HttpTypeMethod.delete:
          response = await dio.delete(
            url,
            data: data,
            queryParameters: queryParameters,
          );
          break;
      }

      // Get the decoded json
      var decodedJson;

      if (response.data is String) {
        debugPrint(response.toString());
        decodedJson = json.decode(response.data);
        debugPrint(decodedJson);
      } else {
        decodedJson = response.data;
      }

      //if (decodedJson['result'] == false || decodedJson['result'] == true) decodedJson['result'] = {'': ''};

      if ((response.statusCode)! > 199 && (response.statusCode)! < 300) {
        if (decodedJson != null) {
          /// Todo check for model json
          ///
          if (decodedJson != null) {
            return Right(List<BaseModel>.from(decodedJson.map((x) => converter(x))));
          } else {
            return const Left(HttpException('Some of the data is missing in response'));
          }
          // return Right(converter(decodedJson));
        } else {
          return const Left(HttpException('Some of the data is missing in response'));
        }

        // Return the http response with actual data
      } else {
        return Left(HttpException(
          decodedJson['errors'],
        ));
      }
    }

    // Handling errors
    on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Left(HttpException(
        e.response?.data['message'] ?? 'Error Occurred while communicating with Server',
      ));
    }

    // Couldn't reach out the server
    on SocketException catch (e, stacktrace) {
      if (kDebugMode) {
        print(e);
        print(stacktrace);
      }

      return const Left(HttpException(
        'No Internet Exception',
      ));
    }
  }
}
