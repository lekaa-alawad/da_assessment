import 'package:da_assessment/core/http/mock_backend.dart';
import 'package:da_assessment/feautre/log_in/domain/usecase/log_in_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/base_error.dart';
import '../model/user_model.dart';
import 'login_remote_datasource.dart';

class ConcreteUserRemoteDataSource extends UserRemoteDataSource {
  @override
  Future<Either<BaseError, UserModel>> login(LogInParams params) {
    return MockBackEnd.login();
  }
}
