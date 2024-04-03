import 'package:da_assessment/feautre/recharge/domain/utils/date_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DateValidator', () {
    test('should return true for new month', () {
      final lastTransactionDate = DateTime(2023, 4, 30);
      final validator = NewMothValidator(lastTransactionDate);
      expect(validator.isValid(), isTrue);
    });

    test('should return true for new month', () {
      final lastTransactionDate = DateTime(2023, 5, 1);
      final validator = NewMothValidator(lastTransactionDate);
      expect(validator.isValid(), isTrue);
    });
    test(' should return false for the same month', () {
      final lastTransactionDate = DateTime(2024, 4, 3);
      final validator = NewMothValidator(lastTransactionDate);
      expect(validator.isValid(), isFalse);
    });
  });
}
