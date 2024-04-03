import 'package:da_assessment/core/http/mock_backend.dart';
import 'package:da_assessment/feautre/log_in/domain/usecase/log_in_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/base_error.dart';
import '../../../../main.dart';
import '../model/login_response_model.dart';
import 'auth_remote_datasource.dart';

class ConcreteAuthRemoteDataSource extends AuthRemoteDataSource {
  @override
  Future<Either<BaseError, LoginResponseModel>> login(LogInParams params) {
    return getIt.get<BackEndService>().login(params: params);
  }
}
