import 'package:da_assessment/feautre/log_in/domain/usecase/log_in_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/data_source/remote_data_source.dart';
import '../../../../core/errors/base_error.dart';
import '../model/user_model.dart';

abstract class UserRemoteDataSource extends RemoteDataSource {
  Future<Either<BaseError, UserModel>> login(LogInParams params);
}
