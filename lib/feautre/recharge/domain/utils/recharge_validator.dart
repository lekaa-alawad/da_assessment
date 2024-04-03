import 'package:da_assessment/feautre/recharge/domain/entity/recharge_validator_result.dart';
import 'package:da_assessment/feautre/recharge/domain/utils/balance_validator.dart';
import 'package:da_assessment/feautre/recharge/domain/utils/date_validator.dart';

import '../../../../core/constant/constant.dart';
import '../../../home_page/data/model/user_model.dart';
import '../../../home_page/domain/entity/user_entity.dart';
import 'beneficiary_monthly_validator.dart';

class RechargeValidator {
  UserEntity? userEntity;
  UserModel? userModel;

  RechargeValidator({this.userEntity, this.userModel});

  RechargeValidatorResult validateRecharge({
    required int beneficiaryId,
    required int rechargeAmount,
  }) {
    //This is just because I am using the same validation in the cubit and in the mock Backend Service
    if (userModel != null) {
      userEntity = userModel!.toEntity();
    }
    //get the beneficiary from the user
    final beneficiary = userEntity!.topUpBeneficiaries.firstWhere((element) => element.id == beneficiaryId);

    if (!SufficientBalanceValidator(userEntity!.balance, rechargeAmount).validate()) {
      return RechargeValidatorResult(isValid: false, message: insufficientBalance);
    }

    if (DateValidator(beneficiary.lastTransaction).isNewMonth()) {
      _resetBeneficiariesAmount();
    }
    final nextTotalAmount = _beneficiariesTotalAmount + rechargeAmount; // number as const;
    if (!BeneficiaryMonthlyLimitValidator(nextTotalAmount, totalMonthlyLimit).validate()) {
      return RechargeValidatorResult(isValid: false, message: totalLimitForAll);
    }

    final monthlyLimit = userEntity!.isVerified ? verifiedMonthlyLimit : unVerifiedMonthlyLimit;
    final nextTotalAmountPerBeneficiary = beneficiary.monthlyTopUpAmount + rechargeAmount;

    if (!BeneficiaryMonthlyLimitValidator(nextTotalAmountPerBeneficiary, monthlyLimit).validate()) {
      return RechargeValidatorResult(isValid: false, message: totalLimitForThisBeneficiary);
    }
    return RechargeValidatorResult(isValid: true, message: rechargeSuccess);
  }

  _resetBeneficiariesAmount() {
    for (var element in userEntity!.topUpBeneficiaries) {
      element.monthlyTopUpAmount = 0;
    }
  }

  get _beneficiariesTotalAmount =>
      userEntity!.topUpBeneficiaries.fold(0, (sum, element) => sum + element.monthlyTopUpAmount);
}
