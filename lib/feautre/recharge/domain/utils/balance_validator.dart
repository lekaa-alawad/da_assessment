import 'package:da_assessment/feautre/recharge/domain/utils/validator_interface.dart';

class SufficientBalanceValidator extends ValidatorInterface {
  final double balance;
  final int rechargeAmount;

  SufficientBalanceValidator(this.balance, this.rechargeAmount);

  @override
  bool isValid() => balance < rechargeAmount ? false : true;
}
