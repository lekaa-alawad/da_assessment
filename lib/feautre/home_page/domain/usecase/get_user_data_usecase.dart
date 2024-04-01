import 'package:da_assessment/feautre/home_page/domain/entity/user_entity.dart';
import 'package:da_assessment/feautre/home_page/domain/repository/user_repository.dart';

import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/usecase.dart';

class GetUserParams extends BaseParams {
  GetUserParams();
  toJson() {}
}

class GetUserUseCase extends UseCase<UserEntity, GetUserParams> {
  final UserRepository repository;

  GetUserUseCase(this.repository);

  @override
  Future<Result<UserEntity>> call({required GetUserParams params}) {
    return repository.getUserData(params: params);
  }
}
