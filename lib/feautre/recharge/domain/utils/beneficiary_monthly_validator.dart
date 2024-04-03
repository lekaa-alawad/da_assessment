import 'package:da_assessment/feautre/recharge/domain/utils/validator_interface.dart';

class BeneficiaryMonthlyLimitValidator extends ValidatorInterface {
  final int nextLimit;
  final int rechargeAmount;

  BeneficiaryMonthlyLimitValidator(this.nextLimit, this.rechargeAmount);
  @override
  bool isValid() => nextLimit > rechargeAmount ? false : true;
}
