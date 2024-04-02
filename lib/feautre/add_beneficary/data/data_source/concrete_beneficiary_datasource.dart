import 'package:dartz/dartz.dart';

import '../../../../core/errors/base_error.dart';
import '../../../../core/http/mock_backend.dart';
import '../../../../main.dart';
import '../../domain/usecase/add_beneficiary_usecase.dart';
import '../model/topup_beneficiary_model.dart';
import 'beneficiary_datasource.dart';

class ConcreteBeneficiaryRemoteDataSource extends BeneficiaryRemoteDataSource {
  @override
  Future<Either<BaseError, TopUpBeneficiaryModel>> addBeneficiary(AddBeneficiaryParams params) {
    return getIt.get<BackEndService>().addBeneficiary(params);
  }
}
