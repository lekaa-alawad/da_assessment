import 'package:da_assessment/feautre/recharge/domain/entity/topup_entity.dart';
import 'package:da_assessment/feautre/recharge/domain/repository/topup_repository.dart';

import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/usecase.dart';

class RechargeParams extends BaseParams {
  RechargeParams({required this.beneficiaryId, required this.rechargeAmountId});
  final int beneficiaryId;
  final int rechargeAmountId;

  toJson() {
    return {"id": beneficiaryId, "rechargeAmountId": rechargeAmountId};
  }
}

class RechargeUseCase extends UseCase<TopUpEntity, RechargeParams> {
  final TopUpRepository repository;

  RechargeUseCase(this.repository);

  @override
  Future<Result<TopUpEntity>> call({required RechargeParams params}) {
    return repository.recharge(params: params);
  }
}
