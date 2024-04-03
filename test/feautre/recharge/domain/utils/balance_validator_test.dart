import 'package:da_assessment/feautre/recharge/domain/utils/balance_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SufficientBalanceValidator', () {
    test('should return true when balance is sufficient', () {
      final validator = SufficientBalanceValidator(100.0, 50);
      expect(validator.validate(), isTrue);
    });

    test('should return false when balance is insufficient', () {
      final validator = SufficientBalanceValidator(50.0, 100);
      expect(validator.validate(), isFalse);
    });
  });
}
