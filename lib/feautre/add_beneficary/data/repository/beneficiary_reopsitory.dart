import 'package:da_assessment/feautre/add_beneficary/data/data_source/beneficiary_datasource.dart';

import '../../../../core/results/result.dart';
import '../../domain/entity/topup_beneficiary_entity.dart';
import '../../domain/repository/beneficiary_repository.dart';
import '../../domain/usecase/add_beneficiary_usecase.dart';

class ConcreteBeneficiaryRepository extends BeneficiaryRepository {
  BeneficiaryRemoteDataSource dataSource;
  ConcreteBeneficiaryRepository({required this.dataSource});

  @override
  Future<Result<TopUpBeneficiaryEntity>> addBeneficiary({required AddBeneficiaryParams params}) async {
    var result = await dataSource.addBeneficiary(params);
    return call(result: result);
  }
}
