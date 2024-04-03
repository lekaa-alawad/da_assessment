import 'package:da_assessment/core/errors/custom_error.dart';
import 'package:da_assessment/core/results/result.dart';
import 'package:da_assessment/feautre/add_beneficary/data/data_source/beneficiary_datasource.dart';
import 'package:da_assessment/feautre/add_beneficary/data/model/topup_beneficiary_model.dart';
import 'package:da_assessment/feautre/add_beneficary/data/repository/beneficiary_reopsitory.dart';
import 'package:da_assessment/feautre/add_beneficary/domain/entity/topup_beneficiary_entity.dart';
import 'package:da_assessment/feautre/add_beneficary/domain/usecase/add_beneficiary_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'beneficiary_repository_test.mocks.dart';

@GenerateMocks([BeneficiaryRemoteDataSource])
void main() {
  late ConcreteBeneficiaryRepository repository;
  late MockBeneficiaryRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockBeneficiaryRemoteDataSource();
    repository = ConcreteBeneficiaryRepository(dataSource: mockDataSource);
  });

  const tBeneficiaryName = 'John Doe';
  const tBeneficiaryNumber = '1234567890';
  final tBeneficiaryModel = TopUpBeneficiaryModel(
      nickname: tBeneficiaryName,
      phoneNumber: tBeneficiaryNumber,
      monthlyTopUpAmount: 0,
      id: 1,
      lastTransaction: DateTime.now());

  final tBeneficiary = TopUpBeneficiaryEntity(
      nickname: tBeneficiaryName,
      phoneNumber: tBeneficiaryNumber,
      monthlyTopUpAmount: 0,
      id: 1,
      lastTransaction: DateTime.now());
  final tParams = AddBeneficiaryParams(beneficiaryName: tBeneficiaryName, beneficiaryNumber: tBeneficiaryNumber);
  final error = CustomError(message: 'Failed to add beneficiary');
  final maxNumberError = CustomError(message: 'Max number of beneficiary reached');

  group('ConcreteBeneficiaryRepository', () {
    test('should add beneficiary when data source returns success', () async {
      // Arrange
      when(mockDataSource.addBeneficiary(tParams)).thenAnswer((_) async => Right(tBeneficiaryModel));

      // Act
      final result = await repository.addBeneficiary(params: tParams);

      // Assert
      expect(result, isA<RemoteResult<TopUpBeneficiaryEntity>>());
      expect(result.data, tBeneficiary);
      expect(result.hasDataOnly, true);
      verify(mockDataSource.addBeneficiary(tParams));
      verifyNoMoreInteractions(mockDataSource);
    });

    test('should return error when data source returns failure', () async {
      // Arrange
      when(mockDataSource.addBeneficiary(tParams)).thenAnswer((_) async => Left(error));

      // Act
      final result = await repository.addBeneficiary(params: tParams);

      // Assert
      expect(result.error, error);
      expect((result.hasErrorOnly), true);
      verify(mockDataSource.addBeneficiary(tParams));
      verifyNoMoreInteractions(mockDataSource);
    });
    test('should return error when reach max number of beneficiaries', () async {
      // Arrange
      when(mockDataSource.addBeneficiary(tParams)).thenAnswer((_) async => Left(maxNumberError));

      // Act
      final result = await repository.addBeneficiary(params: tParams);

      // Assert
      expect(result.error, maxNumberError);
      expect((result.hasErrorOnly), true);
      verify(mockDataSource.addBeneficiary(tParams));
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
