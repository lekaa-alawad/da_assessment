import 'package:da_assessment/core/errors/base_error.dart';
import 'package:da_assessment/feautre/home_page/data/data_source/user_remote_data_source.dart';
import 'package:da_assessment/feautre/home_page/data/model/user_model.dart';
import 'package:da_assessment/feautre/home_page/domain/usecase/get_user_data_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/http/mock_backend.dart';
import '../../../../main.dart';

class ConcreteUserRemoteDataSource extends UserRemoteDataSource {
  @override
  Future<Either<BaseError, UserModel>> getUser(GetUserParams params) {
    return getIt.get<BackEndService>().getUser();
  }
}
