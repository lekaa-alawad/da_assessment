import 'package:da_assessment/feautre/add_beneficary/data/model/topup_beneficiary_model.dart';
import 'package:da_assessment/feautre/add_beneficary/domain/usecase/add_beneficiary_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/data_source/remote_data_source.dart';
import '../../../../core/errors/base_error.dart';

abstract class BeneficiaryRemoteDataSource extends RemoteDataSource {
  Future<Either<BaseError, TopUpBeneficiaryModel>> addBeneficiary(AddBeneficiaryParams params);
}
