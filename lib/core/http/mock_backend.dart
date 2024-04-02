import 'dart:math';

import 'package:da_assessment/core/errors/base_error.dart';
import 'package:da_assessment/core/errors/custom_error.dart';
import 'package:da_assessment/feautre/add_beneficary/data/model/topup_beneficiary_model.dart';
import 'package:da_assessment/feautre/add_beneficary/domain/usecase/add_beneficiary_usecase.dart';
import 'package:da_assessment/feautre/log_in/data/model/login_response_model.dart';
import 'package:dartz/dartz.dart';

import '../../feautre/home_page/data/model/user_model.dart';

class BackEndService {
  static LoginResponseModel loginModel = LoginResponseModel(
    id: '1',
    email: 'lekaa.alawad@gmail.com',
    name: 'leka',
    token: 'token',
  );

  static UserModel userModel = UserModel(
    id: '1',
    email: 'lekaa.alawad@gmail.com',
    name: 'leka',
    balance: 1000,
    isVerified: true,
    topUpBeneficiaries: [
      TopUpBeneficiaryModel(nickname: 'lekaa', phoneNumber: '+97121195226', monthlyTopUpAmount: 100, id: 1),
      TopUpBeneficiaryModel(nickname: 'lekaa', phoneNumber: '+97121195226', monthlyTopUpAmount: 100, id: 2),
      TopUpBeneficiaryModel(nickname: 'lekaa', phoneNumber: '+97121195226', monthlyTopUpAmount: 100, id: 3),
    ],
    historyTopUpBeneficiaries: [
      TopUpBeneficiaryModel(nickname: 'fedaa', phoneNumber: '+97121195226', monthlyTopUpAmount: 100, id: 4),
    ],
  );

  Future<Either<BaseError, Data>> login<Data>() async {
    return Right(loginModel as Data);
  }

  Future<Either<BaseError, Data>> getUser<Data>() async {
    return Right(userModel as Data);
  }

  Future<Either<BaseError, Data>> addBeneficiary<Data>(AddBeneficiaryParams params) async {
    if (userModel.topUpBeneficiaries.length < 5) {
      TopUpBeneficiaryModel beneficiary = TopUpBeneficiaryModel(
          id: Random().nextInt(1000),
          nickname: params.beneficiaryName,
          phoneNumber: params.beneficiaryNumber,
          monthlyTopUpAmount: 0);
      userModel.topUpBeneficiaries.add(beneficiary);
      return Right(beneficiary as Data);
    } else {
      return Left(CustomError(message: 'Max number of beneficiary reached'));
    }
  }
}
