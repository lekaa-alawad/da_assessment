class SufficientBalanceValidator {
  final double balance;
  final int rechargeAmount;

  SufficientBalanceValidator(this.balance, this.rechargeAmount);

  bool validate() {
    if (balance < rechargeAmount) {
      return false;
    }
    return true;
  }
}
