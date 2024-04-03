class BeneficiaryMonthlyLimitValidator {
  final int nextLimit;
  final int rechargeAmount;

  BeneficiaryMonthlyLimitValidator(this.nextLimit, this.rechargeAmount);

  bool validate() {
    if (nextLimit > rechargeAmount) {
      return false;
    }
    return true;
  }
}
