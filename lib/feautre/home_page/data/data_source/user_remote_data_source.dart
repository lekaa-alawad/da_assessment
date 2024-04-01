import 'package:da_assessment/feautre/home_page/data/model/user_model.dart';
import 'package:da_assessment/feautre/home_page/domain/usecase/get_user_data_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/data_source/remote_data_source.dart';
import '../../../../core/errors/base_error.dart';

abstract class UserRemoteDataSource extends RemoteDataSource {
  Future<Either<BaseError, UserModel>> getUser(GetUserParams params);
}
