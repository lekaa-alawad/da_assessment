import 'dart:math';

import 'package:da_assessment/core/errors/base_error.dart';
import 'package:da_assessment/core/errors/custom_error.dart';
import 'package:da_assessment/feautre/add_beneficary/data/model/topup_beneficiary_model.dart';
import 'package:da_assessment/feautre/add_beneficary/domain/usecase/add_beneficiary_usecase.dart';
import 'package:da_assessment/feautre/log_in/data/model/login_response_model.dart';
import 'package:da_assessment/feautre/log_in/domain/usecase/log_in_usecase.dart';
import 'package:da_assessment/feautre/recharge/domain/usecase/recharge_usecase.dart';
import 'package:da_assessment/feautre/transaction_history/data/model/transaction_model.dart';
import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';

import '../../feautre/home_page/data/model/user_model.dart';
import '../../feautre/recharge/data/model/topup_model.dart';
import '../../feautre/recharge/domain/entity/recharge_validator_result.dart';
import '../../feautre/recharge/domain/utils/recharge_validator.dart';
import '../constant/constant.dart';

class BackEndService {
  static final LoginResponseModel _loginModel = LoginResponseModel(
    id: '1',
    email: 'lekaa.alawad@gmail.com',
    name: 'leka',
    token: 'token',
  );

  static final UserModel _userModel = UserModel(
    id: '1',
    email: 'lekaa.alawad@gmail.com',
    name: 'leka',
    balance: 1000,
    isVerified: true,
    topUpBeneficiaries: [
      TopUpBeneficiaryModel(
          nickname: 'lekaa',
          phoneNumber: '+97121195226',
          monthlyTopUpAmount: 10,
          id: 1,
          lastTransaction: DateTime.now()),
      TopUpBeneficiaryModel(
          nickname: 'lekaa',
          phoneNumber: '+97121195226',
          monthlyTopUpAmount: 1000,
          id: 2,
          lastTransaction: DateTime.now()),
      TopUpBeneficiaryModel(
          nickname: 'lekaa',
          phoneNumber: '+97121195226',
          monthlyTopUpAmount: 1000,
          id: 3,
          lastTransaction: DateTime.now()),
    ],
    historyTopUpBeneficiaries: [
      TopUpBeneficiaryModel(
          nickname: 'fedaa',
          phoneNumber: '+97121195226',
          monthlyTopUpAmount: 100,
          id: 4,
          lastTransaction: DateTime.now()),
    ],
  );

  final List<TopUpModel> _topUps = [
    TopUpModel(id: 0, amount: 5),
    TopUpModel(id: 1, amount: 10),
    TopUpModel(id: 2, amount: 20),
    TopUpModel(id: 3, amount: 30),
    TopUpModel(id: 4, amount: 50),
    TopUpModel(id: 5, amount: 75),
    TopUpModel(id: 6, amount: 100),
  ];

  final List<TransactionModel> _transactions = [];

  late final TopUpResponseModel _responseModel = TopUpResponseModel(topUpOptions: _topUps);

  Future<Either<BaseError, Data>> login<Data>({required LogInParams params}) async {
    if (params.email.toLowerCase() == 'lekaa.alawad@gmail.com' && params.password == '123456') {
      return Right(_loginModel as Data);
    } else {
      return Left(CustomError(message: 'Invalid email or password'));
    }
  }

  Future<Either<BaseError, Data>> getUser<Data>() async {
    return Right(_userModel as Data);
  }

  Future<Either<BaseError, Data>> addBeneficiary<Data>(AddBeneficiaryParams params) async {
    if (_userModel.topUpBeneficiaries.length < 5) {
      TopUpBeneficiaryModel beneficiary = TopUpBeneficiaryModel(
          id: Random().nextInt(1000),
          nickname: params.beneficiaryName,
          phoneNumber: params.beneficiaryNumber,
          lastTransaction: DateTime.now(),
          monthlyTopUpAmount: 0);
      _userModel.topUpBeneficiaries.add(beneficiary);
      return Right(beneficiary as Data);
    } else {
      return Left(CustomError(message: 'Max number of beneficiary reached'));
    }
  }

  Future<Either<BaseError, Data>> getTopUp<Data>() async {
    return Right(_responseModel as Data);
  }

  Future<Either<BaseError, Data>> recharge<Data>({required RechargeParams params}) async {
    TopUpModel selectedTopUp = _topUps.firstWhere((element) => element.id == params.rechargeAmountId);
    int rechargeAmount = selectedTopUp.amount + transactionFee;
    final RechargeValidatorResult result = RechargeValidator(userEntity: _userModel.toEntity()).validateRecharge(
      beneficiaryId: params.beneficiaryId,
      rechargeAmount: rechargeAmount,
    );
    if (!result.isValid) {
      return Left(CustomError(message: result.message));
    }
    //TopUp fee
    _userModel.balance -= transactionFee;
    //decrease balance
    _userModel.balance -= selectedTopUp.amount;
    //add topup to beneficiary
    TopUpBeneficiaryModel beneficiary =
        _userModel.topUpBeneficiaries.firstWhere((element) => element.id == params.beneficiaryId);
    beneficiary.monthlyTopUpAmount += selectedTopUp.amount;
    //update last transaction
    DateTime transactionDate = DateTime.now();
    beneficiary.lastTransaction = transactionDate;

    final dateFormat = DateFormat('yy/MM/dd hh:mm');
    final formattedDate = dateFormat.format(DateTime.parse(transactionDate.toIso8601String()));

    _transactions.add(TransactionModel(
      beneficiaryName: beneficiary.nickname,
      beneficiaryPhone: beneficiary.phoneNumber,
      beneficiaryId: beneficiary.id.toString(),
      amount: selectedTopUp.amount.toString(),
      date: formattedDate,
    ));

    return Right(selectedTopUp as Data);
  }

  Either<BaseError, TransactionResponseModel> getTransactions() {
    return Right(TransactionResponseModel(transactions: _transactions));
  }
}
