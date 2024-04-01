import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../entites/base_entity.dart';
import '../errors/base_error.dart';
import '../models/base_model.dart';
import '../results/result.dart';

abstract class CoreRepository {
  RemoteResult<Entity> call<Model extends BaseModel<Entity>, Entity extends BaseEntity>({
    required Either<BaseError, Model> result,
  }) {
    if (kDebugMode) {
      print('in core repository : ${result.isRight()}');
    }
    if (result.isRight()) {
      return RemoteResult(
        data: (result as Right<BaseError, Model>).value.toEntity(),
      );
    } else {
      return RemoteResult(
        error: (result as Left<BaseError, Model>).value,
      );
    }
  }

  RemoteResult<List<Entity>> callForList<Model extends BaseModel<Entity>, Entity extends BaseEntity>({
    required Either<BaseError, List<Model>> result,
  }) {
    if (result.isRight()) {
      return RemoteResult(
        data: (result as Right<BaseError, List<Model>>).value.map((model) => model.toEntity()).toList(),
      );
    } else {
      return RemoteResult(
        error: (result as Left<BaseError, List<Model>>).value,
      );
    }
  }
}
