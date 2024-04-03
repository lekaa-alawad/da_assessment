// Mocks generated by Mockito 5.4.4 from annotations
// in da_assessment/test/feautre/recharge/domain/usecase/recharge_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:da_assessment/core/entites/base_entity.dart' as _i9;
import 'package:da_assessment/core/errors/base_error.dart' as _i11;
import 'package:da_assessment/core/models/base_model.dart' as _i8;
import 'package:da_assessment/core/results/result.dart' as _i2;
import 'package:da_assessment/feautre/recharge/domain/entity/topup_entity.dart'
    as _i5;
import 'package:da_assessment/feautre/recharge/domain/repository/topup_repository.dart'
    as _i3;
import 'package:da_assessment/feautre/recharge/domain/usecase/get_topup_option_usecase.dart'
    as _i6;
import 'package:da_assessment/feautre/recharge/domain/usecase/recharge_usecase.dart'
    as _i7;
import 'package:dartz/dartz.dart' as _i10;
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

class _FakeResult_0<Data> extends _i1.SmartFake implements _i2.Result<Data> {
  _FakeResult_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRemoteResult_1<Data> extends _i1.SmartFake
    implements _i2.RemoteResult<Data> {
  _FakeRemoteResult_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TopUpRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTopUpRepository extends _i1.Mock implements _i3.TopUpRepository {
  MockTopUpRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Result<_i5.TopUpResponseEntity>> getTopUps(
          {required _i6.GetTopUpsParams? params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopUps,
          [],
          {#params: params},
        ),
        returnValue: _i4.Future<_i2.Result<_i5.TopUpResponseEntity>>.value(
            _FakeResult_0<_i5.TopUpResponseEntity>(
          this,
          Invocation.method(
            #getTopUps,
            [],
            {#params: params},
          ),
        )),
      ) as _i4.Future<_i2.Result<_i5.TopUpResponseEntity>>);

  @override
  _i4.Future<_i2.Result<_i5.TopUpEntity>> recharge(
          {required _i7.RechargeParams? params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #recharge,
          [],
          {#params: params},
        ),
        returnValue: _i4.Future<_i2.Result<_i5.TopUpEntity>>.value(
            _FakeResult_0<_i5.TopUpEntity>(
          this,
          Invocation.method(
            #recharge,
            [],
            {#params: params},
          ),
        )),
      ) as _i4.Future<_i2.Result<_i5.TopUpEntity>>);

  @override
  _i2.RemoteResult<Entity>
      call<Model extends _i8.BaseModel<Entity>, Entity extends _i9.BaseEntity>(
              {required _i10.Either<_i11.BaseError, Model>? result}) =>
          (super.noSuchMethod(
            Invocation.method(
              #call,
              [],
              {#result: result},
            ),
            returnValue: _FakeRemoteResult_1<Entity>(
              this,
              Invocation.method(
                #call,
                [],
                {#result: result},
              ),
            ),
          ) as _i2.RemoteResult<Entity>);

  @override
  _i2.RemoteResult<List<Entity>> callForList<
              Model extends _i8.BaseModel<Entity>,
              Entity extends _i9.BaseEntity>(
          {required _i10.Either<_i11.BaseError, List<Model>>? result}) =>
      (super.noSuchMethod(
        Invocation.method(
          #callForList,
          [],
          {#result: result},
        ),
        returnValue: _FakeRemoteResult_1<List<Entity>>(
          this,
          Invocation.method(
            #callForList,
            [],
            {#result: result},
          ),
        ),
      ) as _i2.RemoteResult<List<Entity>>);
}
