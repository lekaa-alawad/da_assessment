import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/user_entity.dart';
import '../repository/user_repository.dart';

class LogInParams extends BaseParams {
  LogInParams({required this.email, required this.password});

  final String email;
  final String password;

  toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class LogInUseCase extends UseCase<UserEntity, LogInParams> {
  final UserRepository repository;

  LogInUseCase(this.repository);

  @override
  Future<Result<UserEntity>> call({required LogInParams params}) {
    return repository.login(params: params);
  }
}
