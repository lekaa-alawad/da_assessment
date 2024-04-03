import 'package:da_assessment/core/errors/custom_error.dart';
import 'package:da_assessment/core/results/result.dart';
import 'package:da_assessment/feautre/recharge/domain/entity/topup_entity.dart';
import 'package:da_assessment/feautre/recharge/domain/repository/topup_repository.dart';
import 'package:da_assessment/feautre/recharge/domain/usecase/recharge_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_topup_usecase_test.mocks.dart';

@GenerateMocks([TopUpRepository])
void main() {
  late RechargeUseCase useCase;
  late MockTopUpRepository mockRepository;

  setUp(() {
    mockRepository = MockTopUpRepository(); // Create an instance of the mock class
    useCase = RechargeUseCase(mockRepository);
  });

  const tBeneficiaryId = 1;
  const tRechargeAmountId = 2;
  final tTopUpEntity = TopUpEntity(id: tBeneficiaryId, amount: tRechargeAmountId);
  final tParams = RechargeParams(beneficiaryId: tBeneficiaryId, rechargeAmountId: tRechargeAmountId);

  final error = CustomError(message: 'Failed to recharge');
  test('should recharge for the beneficiary', () async {
    // Arrange
    when(mockRepository.recharge(params: tParams)).thenAnswer((_) async => RemoteResult(data: tTopUpEntity));

    // Act
    final result = await useCase(params: tParams);

    // Assert
    expect(result, isA<RemoteResult<TopUpEntity>>());
    expect(result.data, tTopUpEntity);
    verify(mockRepository.recharge(params: tParams));
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return error when recharge fails', () async {
    // Arrange
    when(mockRepository.recharge(params: tParams)).thenAnswer((_) async => RemoteResult(error: error));

    // Act
    final result = await useCase(params: tParams);

    // Assert
    expect(result.hasErrorOnly, true);
    expect(result.error, error);
    verify(mockRepository.recharge(params: tParams));
    verifyNoMoreInteractions(mockRepository);
  });
}
