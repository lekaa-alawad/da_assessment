import 'package:da_assessment/core/errors/custom_error.dart';
import 'package:da_assessment/core/results/result.dart';
import 'package:da_assessment/feautre/add_beneficary/domain/entity/topup_beneficiary_entity.dart';
import 'package:da_assessment/feautre/add_beneficary/domain/repository/beneficiary_repository.dart';
import 'package:da_assessment/feautre/add_beneficary/domain/usecase/add_beneficiary_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_beneficiary_usecase_test.mocks.dart';

@GenerateMocks([BeneficiaryRepository])
void main() {
  late AddBeneficiaryUseCase useCase;
  late MockBeneficiaryRepository mockRepository;

  setUp(() {
    mockRepository = MockBeneficiaryRepository();
    useCase = AddBeneficiaryUseCase(mockRepository);
  });

  const tBeneficiaryName = 'John Doe';
  const tBeneficiaryNumber = '1234567890';
  final tBeneficiary = TopUpBeneficiaryEntity(
      nickname: tBeneficiaryName,
      phoneNumber: tBeneficiaryNumber,
      monthlyTopUpAmount: 0,
      id: 1,
      lastTransaction: DateTime.now());
  final tParams = AddBeneficiaryParams(beneficiaryName: tBeneficiaryName, beneficiaryNumber: tBeneficiaryNumber);
  final maxNumberError = CustomError(message: 'Max number of beneficiary reached');
  final customError = CustomError(message: 'Something went wrong');
  test('should add beneficiary from repository', () async {
    // Arrange
    when(mockRepository.addBeneficiary(params: tParams)).thenAnswer((_) async => RemoteResult(data: tBeneficiary));

    // Act
    final result = await useCase(params: tParams);

    // Assert
    expect(result, isA<RemoteResult<TopUpBeneficiaryEntity>>());
    expect(result.data, tBeneficiary);
    verify(mockRepository.addBeneficiary(params: tParams));
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return error when adding beneficiary fails', () async {
    // Arrange
    when(mockRepository.addBeneficiary(params: tParams)).thenAnswer((_) async => RemoteResult(error: maxNumberError));

    // Act
    final result = await useCase(params: tParams);

    // Assert
    expect(result.error, maxNumberError);
    expect((result.hasErrorOnly), true);
    verify(mockRepository.addBeneficiary(params: tParams));
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return error when', () async {
    // Arrange
    when(mockRepository.addBeneficiary(params: tParams)).thenAnswer((_) async => RemoteResult(error: customError));

    // Act
    final result = await useCase(params: tParams);

    // Assert
    expect(result.error, customError);
    expect((result.hasErrorOnly), true);
    verify(mockRepository.addBeneficiary(params: tParams));
    verifyNoMoreInteractions(mockRepository);
  });
}
