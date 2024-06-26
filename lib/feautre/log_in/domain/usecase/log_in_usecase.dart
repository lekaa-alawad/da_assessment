import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/login_response_entity.dart';
import '../repository/auth_repository.dart';

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

class LogInUseCase extends UseCase<LoginResponseEntity, LogInParams> {
  final AuthRepository repository;

  LogInUseCase(this.repository);

  @override
  Future<Result<LoginResponseEntity>> call({required LogInParams params}) {
    return repository.login(params: params);
  }
}
