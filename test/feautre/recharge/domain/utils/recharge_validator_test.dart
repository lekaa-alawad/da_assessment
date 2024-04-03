import 'package:da_assessment/core/constant/constant.dart';
import 'package:da_assessment/feautre/add_beneficary/domain/entity/topup_beneficiary_entity.dart';
import 'package:da_assessment/feautre/home_page/domain/entity/user_entity.dart';
import 'package:da_assessment/feautre/recharge/domain/utils/recharge_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RechargeValidator', () {
    final userEntity = UserEntity(
      id: '1',
      email: 'test@example.com',
      balance: 1000.0,
      isVerified: true,
      topUpBeneficiaries: [
        TopUpBeneficiaryEntity(
          id: 1,
          nickname: 'Beneficiary 1',
          phoneNumber: '1234567890',
          monthlyTopUpAmount: 100,
          lastTransaction: DateTime(2023, 4, 30),
        ),
        TopUpBeneficiaryEntity(
          id: 2,
          nickname: 'Beneficiary 2',
          phoneNumber: '0987654321',
          monthlyTopUpAmount: 200,
          lastTransaction: DateTime(2023, 5, 1),
        ),
      ],
      name: 'Lekaa',
    );

    final userEntityForTotalMonthlyInvalid = UserEntity(
      id: '1',
      email: 'test@example.com',
      balance: 1000.0,
      isVerified: true,
      topUpBeneficiaries: [
        TopUpBeneficiaryEntity(
          id: 1,
          nickname: 'Beneficiary 1',
          phoneNumber: '1234567890',
          monthlyTopUpAmount: 2000,
          lastTransaction: DateTime(2024, 4, 3),
        ),
        TopUpBeneficiaryEntity(
          id: 2,
          nickname: 'Beneficiary 2',
          phoneNumber: '0987654321',
          monthlyTopUpAmount: 1000,
          lastTransaction: DateTime(2023, 4, 2),
        ),
      ],
      name: 'Lekaa',
    );

    test('should return valid result for successful recharge', () {
      final validator = RechargeValidator(userEntity: userEntity);
      final result = validator.validateRecharge(beneficiaryId: 1, rechargeAmount: 50);
      expect(result.isValid, isTrue);
      expect(result.message, rechargeSuccess);
    });

    test('should return invalid result for insufficient balance', () {
      final validator = RechargeValidator(userEntity: userEntity);
      final result = validator.validateRecharge(beneficiaryId: 1, rechargeAmount: 2000);
      expect(result.isValid, isFalse);
      expect(result.message, insufficientBalance);
    });

    test('should return invalid result for total monthly limit exceeded', () {
      final validator = RechargeValidator(userEntity: userEntityForTotalMonthlyInvalid);
      final result = validator.validateRecharge(beneficiaryId: 1, rechargeAmount: 10);
      expect(result.isValid, isFalse);
      expect(result.message, totalLimitForAll);
    });

    test('should return invalid result for beneficiary monthly limit exceeded', () {
      final validator = RechargeValidator(userEntity: userEntity);
      final result = validator.validateRecharge(beneficiaryId: 1, rechargeAmount: 901);
      expect(result.isValid, isFalse);
      expect(result.message, totalLimitForThisBeneficiary);
    });

    test('should return valid result for beneficiary because he is in new month', () {
      final validator = RechargeValidator(userEntity: userEntity);
      final result = validator.validateRecharge(beneficiaryId: 2, rechargeAmount: 901);
      expect(result.isValid, isFalse);
      expect(result.message, totalLimitForThisBeneficiary);
    });
  });
}
