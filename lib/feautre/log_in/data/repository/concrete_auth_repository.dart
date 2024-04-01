import 'package:da_assessment/feautre/log_in/domain/usecase/log_in_usecase.dart';

import '../../../../core/results/result.dart';
import '../../domain/entity/login_response_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_remote_datasource.dart';

class ConcreteAuthRepository extends AuthRepository {
  AuthRemoteDataSource remoteDataSource;
  ConcreteAuthRepository({required this.remoteDataSource});

  @override
  Future<Result<LoginResponseEntity>> login({required LogInParams params}) async {
    final result = await remoteDataSource.login(params);
    return call(result: result);
  }
}
