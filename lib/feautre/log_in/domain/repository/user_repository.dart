import 'package:da_assessment/feautre/log_in/domain/usecase/log_in_usecase.dart';

import '../../../../core/repositories/core_repository.dart';
import '../../../../core/results/result.dart';
import '../entity/login_response_entity.dart';

abstract class UserRepository extends CoreRepository {
  Future<Result<LoginResponseEntity>> login({required LogInParams params});
}
