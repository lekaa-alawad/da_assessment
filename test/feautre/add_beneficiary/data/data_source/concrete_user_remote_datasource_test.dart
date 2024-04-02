import 'package:da_assessment/core/errors/base_error.dart';
import 'package:da_assessment/core/errors/custom_error.dart';
import 'package:da_assessment/feautre/add_beneficary/data/data_source/concrete_beneficiary_datasource.dart';
import 'package:da_assessment/feautre/add_beneficary/data/model/topup_beneficiary_model.dart';
import 'package:da_assessment/feautre/add_beneficary/domain/usecase/add_beneficiary_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'concrete_user_remote_datasource_test.mocks.dart';

@GenerateMocks([ConcreteBeneficiaryRemoteDataSource])
void main() {
  late ConcreteBeneficiaryRemoteDataSource dataSource;

  setUp(() {
    dataSource = MockConcreteBeneficiaryRemoteDataSource();
  });

  final tBeneficiaryName = 'John Doe';
  final tBeneficiaryNumber = '1234567890';
  final tParams = AddBeneficiaryParams(beneficiaryName: tBeneficiaryName, beneficiaryNumber: tBeneficiaryNumber);
  final tBeneficiaryModel =
      TopUpBeneficiaryModel(nickname: tBeneficiaryName, phoneNumber: tBeneficiaryNumber, monthlyTopUpAmount: 0);
  final tError = CustomError(message: 'Failed to add beneficiary');
  final tMaxNumberError = CustomError(message: 'Max number of beneficiary reached');
  group('ConcreteBeneficiaryRemoteDataSource', () {
    test('should return TopUpBeneficiaryModel when adding beneficiary is successful', () async {
      // Arrange
      when(dataSource.addBeneficiary(tParams)).thenAnswer((_) async => Right(tBeneficiaryModel));

      // Act
      final result = await dataSource.addBeneficiary(tParams);

      // Assert
      expect(result, isA<Right<BaseError, TopUpBeneficiaryModel>>());
      verify(dataSource.addBeneficiary(tParams));
      verifyNoMoreInteractions(dataSource);
    });

    test('should return BaseError when adding beneficiary fails', () async {
      // Arrange

      when(dataSource.addBeneficiary(tParams)).thenAnswer((_) async => Left(tError));

      // Act
      final result = await dataSource.addBeneficiary(tParams);

      // Assert
      expect(result, isA<Left<BaseError, TopUpBeneficiaryModel>>());
      expect(result.isLeft(), true);
      expect((result as Left).value, tError);
      verify(dataSource.addBeneficiary(tParams));
      verifyNoMoreInteractions(dataSource);
    });
    test('should return BaseError when reach max number of beneficiary', () async {
      // Arrange

      when(dataSource.addBeneficiary(tParams)).thenAnswer((_) async => Left(tMaxNumberError));

      // Act
      final result = await dataSource.addBeneficiary(tParams);

      // Assert
      expect(result, isA<Left<BaseError, TopUpBeneficiaryModel>>());
      expect(result.isLeft(), true);
      expect((result as Left).value, tMaxNumberError);
      verify(dataSource.addBeneficiary(tParams));
      verifyNoMoreInteractions(dataSource);
    });
  });
}
