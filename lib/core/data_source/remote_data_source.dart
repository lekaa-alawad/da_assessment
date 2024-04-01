import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../errors/base_error.dart';
import '../http/api_provider.dart';
import '../http/http_method.dart';
import '../responses/ApiResponse.dart';

abstract class RemoteDataSource {
  Future<Either<BaseError, Data>> request<Data, Response extends ApiResponse<Data>>({
    required Response Function(Map<String, dynamic>) converter,
    required HttpTypeMethod method,
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    bool withAuthentication = false,
  }) async {
    final Map<String, String> headers = {};

    // Get auth token (if withAuthentication)
    // if (withAuthentication) {
    //   await checkTokenValidation();
    //   if (await UserRepository.hasToken) {
    //     final token = await UserRepository.authToken;
    //     headers.putIfAbsent(HEADER_AUTH, () => 'Bearer $token');
    //     print(headers);
    //   }
    // }

    final response = await ApiProvider.sendObjectRequest<Response>(
      method: method,
      url: url,
      headers: headers,
      queryParameters: queryParameters,
      data: data,
      converter: converter,
    );
    if (kDebugMode) {
      print('is right : ${response.isRight()}');
    }
    if (response.isLeft()) {
      return Left((response as Left<BaseError, Response>).value);
    } else {
      final resValue = (response as Right<BaseError, Response>).value;
      return Right(resValue.result);
    }
  }

  Future<Either<BaseError, List<Data>>> requestList<Data>({
    required Data Function(Map<String, dynamic>) converter,
    required HttpTypeMethod method,
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    bool withAuthentication = false,
  }) async {
    final Map<String, String> headers = {};

    // Get auth token (if withAuthentication)
    // if (withAuthentication) {
    //   await checkTokenValidation();
    //   if (await UserRepository.hasToken) {
    //     final token = await UserRepository.authToken;
    //     headers.putIfAbsent(HEADER_AUTH, () => 'Bearer $token');
    //     print(headers);
    //   }
    // }

    final response = await ApiProvider.sendListRequest<Data>(
      method: method,
      url: url,
      headers: headers,
      queryParameters: queryParameters,
      data: data,
      converter: converter,
    );
    if (response.isLeft()) {
      return Left((response as Left<BaseError, List<Data>>).value);
    } else {
      final resValue = (response as Right<BaseError, List<Data>>).value;
      return Right(resValue);
    }
  }

  // Future<void> persistToken(String token, String expireDate) async {
  //   await UserRepository.persistToken(token, expireDate);
  // }

  Future<Either<BaseError, Data>> nonStructuredRequest<Data>({
    required Data Function(Map<String, dynamic>) converter,
    required HttpTypeMethod method,
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    bool withAuthentication = false,
  }) async {
    final Map<String, String> headers = {};

    // if (withAuthentication) {
    //   await checkTokenValidation();
    //   if (await UserRepository.hasToken) {
    //     final token = await UserRepository.authToken;
    //     print("from request: " + token);
    //     headers.putIfAbsent(HEADER_AUTH, () => 'Bearer $token');
    //     print(headers);
    //   }
    // }
    final response = await ApiProvider.sendObjectRequest<Data>(
      method: method,
      url: url,
      headers: headers,
      queryParameters: queryParameters,
      data: data,
      converter: converter,
    );
    print('is right : ${response.isRight()}');
    print(response.isLeft());
    if (response.isLeft()) {
      print('is left');
      return Left((response as Left<BaseError, Data>).value);
    } else {
      print('in else');

      final resValue = (response as Right<BaseError, Data>).value;
      return Right((response as Right<BaseError, Data>).value);
    }
  }
}
