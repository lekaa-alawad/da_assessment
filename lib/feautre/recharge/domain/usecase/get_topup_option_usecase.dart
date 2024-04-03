import 'package:da_assessment/feautre/recharge/domain/entity/topup_entity.dart';
import 'package:da_assessment/feautre/recharge/domain/repository/topup_repository.dart';

import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/usecase.dart';

class GetTopUpsParams extends BaseParams {
  GetTopUpsParams();
  toJson() {}
}

class GetTopUpsUseCase extends UseCase<TopUpResponseEntity, GetTopUpsParams> {
  final TopUpRepository repository;

  GetTopUpsUseCase(this.repository);

  @override
  Future<Result<TopUpResponseEntity>> call({required GetTopUpsParams params}) {
    return repository.getTopUps(params: params);
  }
}
