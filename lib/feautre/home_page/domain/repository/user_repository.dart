import 'package:da_assessment/feautre/home_page/domain/usecase/get_user_data_usecase.dart';

import '../../../../core/repositories/core_repository.dart';
import '../../../../core/results/result.dart';
import '../entity/user_entity.dart';

abstract class UserRepository extends CoreRepository {
  Future<Result<UserEntity>> getUserData({required GetUserParams params});
}
