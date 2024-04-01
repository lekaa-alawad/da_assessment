import 'package:da_assessment/core/errors/base_error.dart';
import 'package:da_assessment/feautre/home_page/data/model/topup_beneficiary_model.dart';
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
      TopUpBeneficiaryModel(nickname: 'lekaa', phoneNumber: '+97121195226', monthlyTopUpAmount: 100),
      TopUpBeneficiaryModel(nickname: 'lekaa', phoneNumber: '+97121195226', monthlyTopUpAmount: 100),
      TopUpBeneficiaryModel(nickname: 'lekaa', phoneNumber: '+97121195226', monthlyTopUpAmount: 100)
    ],
    historyTopUpBeneficiaries: [
      TopUpBeneficiaryModel(nickname: 'fedaa', phoneNumber: '+97121195226', monthlyTopUpAmount: 100),
    ],
  );

  Future<Either<BaseError, Data>> login<Data>() async {
    return Right(loginModel as Data);
  }

  Future<Either<BaseError, Data>> getUser<Data>() async {
    return Right(userModel as Data);
  }
}
