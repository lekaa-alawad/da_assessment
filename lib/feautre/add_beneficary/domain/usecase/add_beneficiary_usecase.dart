import 'package:da_assessment/feautre/add_beneficary/domain/repository/beneficiary_repository.dart';

import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/topup_beneficiary_entity.dart';

class AddBeneficiaryParams extends BaseParams {
  AddBeneficiaryParams({required this.beneficiaryName, required this.beneficiaryNumber});

  final String beneficiaryName;
  final String beneficiaryNumber;
  toJson() {
    return {'beneficiaryName': beneficiaryName, 'beneficiaryNumber': beneficiaryNumber};
  }
}

class AddBeneficiaryUseCase extends UseCase<TopUpBeneficiaryEntity, AddBeneficiaryParams> {
  final BeneficiaryRepository repository;

  AddBeneficiaryUseCase(this.repository);

  @override
  Future<Result<TopUpBeneficiaryEntity>> call({required AddBeneficiaryParams params}) {
    return repository.addBeneficiary(params: params);
  }
}
