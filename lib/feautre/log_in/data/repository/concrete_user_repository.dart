import 'package:da_assessment/feautre/log_in/domain/usecase/log_in_usecase.dart';

import '../../../../core/results/result.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repository/user_repository.dart';
import '../data_source/login_remote_datasource.dart';

class ConcreteUserRepository extends UserRepository {
  UserRemoteDataSource remoteDataSource;
  ConcreteUserRepository({required this.remoteDataSource});

  @override
  Future<Result<UserEntity>> login({required LogInParams params}) async {
    final result = await remoteDataSource.login(params);
    return call(result: result);
  }
}
