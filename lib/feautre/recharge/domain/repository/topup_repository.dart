import 'package:da_assessment/core/repositories/core_repository.dart';
import 'package:da_assessment/feautre/recharge/domain/entity/topup_entity.dart';
import 'package:da_assessment/feautre/recharge/domain/usecase/get_topup_option_usecase.dart';

import '../../../../core/results/result.dart';
import '../usecase/recharge_usecase.dart';

abstract class TopUpRepository extends CoreRepository {
  Future<Result<TopUpResponseEntity>> getTopUps({required GetTopUpsParams params});

  Future<Result<TopUpEntity>> recharge({required RechargeParams params});
}
