// Mocks generated by Mockito 5.4.4 from annotations
// in da_assessment/test/feautre/transaction_history/data/data_source/concrete_remote_transaction_datasource_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:da_assessment/core/errors/base_error.dart' as _i5;
import 'package:da_assessment/core/http/http_method.dart' as _i9;
import 'package:da_assessment/core/responses/api_response.dart' as _i8;
import 'package:da_assessment/feautre/transaction_history/data/data_source/concrete_transaction_remote_datasource.dart'
    as _i3;
import 'package:da_assessment/feautre/transaction_history/data/model/transaction_model.dart'
    as _i6;
import 'package:da_assessment/feautre/transaction_history/domain/usecase/get_transaction_usecase.dart'
    as _i7;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ConcreteTransactionRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockConcreteTransactionRemoteDataSource extends _i1.Mock
    implements _i3.ConcreteTransactionRemoteDataSource {
  MockConcreteTransactionRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<
      _i2.Either<_i5.BaseError, _i6.TransactionResponseModel>> getTransactions(
          _i7.GetTransactionsParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTransactions,
          [params],
        ),
        returnValue: _i4.Future<
                _i2.Either<_i5.BaseError, _i6.TransactionResponseModel>>.value(
            _FakeEither_0<_i5.BaseError, _i6.TransactionResponseModel>(
          this,
          Invocation.method(
            #getTransactions,
            [params],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.BaseError, _i6.TransactionResponseModel>>);

  @override
  _i4.Future<_i2.Either<_i5.BaseError, Data>>
      request<Data, Response extends _i8.ApiResponse<Data>>({
    required Response Function(Map<String, dynamic>)? converter,
    required _i9.HttpTypeMethod? method,
    required String? url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    bool? withAuthentication = false,
  }) =>
          (super.noSuchMethod(
            Invocation.method(
              #request,
              [],
              {
                #converter: converter,
                #method: method,
                #url: url,
                #queryParameters: queryParameters,
                #data: data,
                #withAuthentication: withAuthentication,
              },
            ),
            returnValue: _i4.Future<_i2.Either<_i5.BaseError, Data>>.value(
                _FakeEither_0<_i5.BaseError, Data>(
              this,
              Invocation.method(
                #request,
                [],
                {
                  #converter: converter,
                  #method: method,
                  #url: url,
                  #queryParameters: queryParameters,
                  #data: data,
                  #withAuthentication: withAuthentication,
                },
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.BaseError, Data>>);

  @override
  _i4.Future<_i2.Either<_i5.BaseError, List<Data>>> requestList<Data>({
    required Data Function(Map<String, dynamic>)? converter,
    required _i9.HttpTypeMethod? method,
    required String? url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    bool? withAuthentication = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #requestList,
          [],
          {
            #converter: converter,
            #method: method,
            #url: url,
            #queryParameters: queryParameters,
            #data: data,
            #withAuthentication: withAuthentication,
          },
        ),
        returnValue: _i4.Future<_i2.Either<_i5.BaseError, List<Data>>>.value(
            _FakeEither_0<_i5.BaseError, List<Data>>(
          this,
          Invocation.method(
            #requestList,
            [],
            {
              #converter: converter,
              #method: method,
              #url: url,
              #queryParameters: queryParameters,
              #data: data,
              #withAuthentication: withAuthentication,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.BaseError, List<Data>>>);

  @override
  _i4.Future<_i2.Either<_i5.BaseError, Data>> nonStructuredRequest<Data>({
    required Data Function(Map<String, dynamic>)? converter,
    required _i9.HttpTypeMethod? method,
    required String? url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    bool? withAuthentication = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #nonStructuredRequest,
          [],
          {
            #converter: converter,
            #method: method,
            #url: url,
            #queryParameters: queryParameters,
            #data: data,
            #withAuthentication: withAuthentication,
          },
        ),
        returnValue: _i4.Future<_i2.Either<_i5.BaseError, Data>>.value(
            _FakeEither_0<_i5.BaseError, Data>(
          this,
          Invocation.method(
            #nonStructuredRequest,
            [],
            {
              #converter: converter,
              #method: method,
              #url: url,
              #queryParameters: queryParameters,
              #data: data,
              #withAuthentication: withAuthentication,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.BaseError, Data>>);
}
