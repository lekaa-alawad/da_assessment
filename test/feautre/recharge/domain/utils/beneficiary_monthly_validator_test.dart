import 'package:da_assessment/feautre/recharge/domain/utils/beneficiary_monthly_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BeneficiaryMonthlyLimitValidator', () {
    test('should return true when limit is exceeded', () {
      final validator = BeneficiaryMonthlyLimitValidator(100, 50);
      expect(validator.isValid(), isFalse);
    });

    test('should return false when limit is not exceeded', () {
      final validator = BeneficiaryMonthlyLimitValidator(50, 100);
      expect(validator.isValid(), isTrue);
    });
  });
}
