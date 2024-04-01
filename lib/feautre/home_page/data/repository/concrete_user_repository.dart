import 'package:da_assessment/core/results/result.dart';
import 'package:da_assessment/feautre/home_page/domain/entity/user_entity.dart';
import 'package:da_assessment/feautre/home_page/domain/repository/user_repository.dart';
import 'package:da_assessment/feautre/home_page/domain/usecase/get_user_data_usecase.dart';

import '../data_source/user_remote_data_source.dart';

class ConcreteUserRepository extends UserRepository {
  UserRemoteDataSource remoteDataSource;
  ConcreteUserRepository({required this.remoteDataSource});

  @override
  Future<Result<UserEntity>> getUserData({required GetUserParams params}) async {
    final result = await remoteDataSource.getUser(params);
    return call(result: result);
  }
}
