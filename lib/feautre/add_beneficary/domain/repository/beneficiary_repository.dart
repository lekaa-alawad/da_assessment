import '../../../../core/repositories/core_repository.dart';
import '../../../../core/results/result.dart';
import '../entity/topup_beneficiary_entity.dart';
import '../usecase/add_beneficiary_usecase.dart';

abstract class BeneficiaryRepository extends CoreRepository {
  Future<Result<TopUpBeneficiaryEntity>> addBeneficiary({required AddBeneficiaryParams params});
}
