import 'package:da_assessment/core/errors/custom_error.dart';
import 'package:da_assessment/core/results/result.dart';
import 'package:da_assessment/feautre/recharge/data/data_source/topup_remote_datasource.dart';
import 'package:da_assessment/feautre/recharge/data/model/topup_model.dart';
import 'package:da_assessment/feautre/recharge/data/repository/concrete_topup_repository.dart';
import 'package:da_assessment/feautre/recharge/domain/entity/topup_entity.dart';
import 'package:da_assessment/feautre/recharge/domain/usecase/get_topup_option_usecase.dart';
import 'package:da_assessment/feautre/recharge/domain/usecase/recharge_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'concrete_topup_repository_test.mocks.dart';

@GenerateMocks([TopUpRemoteDataSource])
void main() {
  late ConcreteTopUpRepository repository;
  late MockTopUpRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockTopUpRemoteDataSource();
    repository = ConcreteTopUpRepository(remoteDataSource: mockDataSource);
  });

  group('getTopUps', () {
    final tTopUpResponse = TopUpResponseEntity(
      topUpOptions: [
        TopUpEntity(amount: 10, id: 1),
        TopUpEntity(amount: 20, id: 2),
        TopUpEntity(amount: 30, id: 3),
      ],
    );
    final tTopUpResponseModel = TopUpResponseModel(
      topUpOptions: [
        TopUpModel(amount: 10, id: 1),
        TopUpModel(amount: 20, id: 2),
        TopUpModel(amount: 30, id: 3),
      ],
    );
    final tParams = GetTopUpsParams();
    final error = CustomError(message: 'Failed to get top-up options');

    test('should return TopUpResponseEntity when getting top-up options is successful', () async {
      // Arrange
      when(mockDataSource.getTopUps(params: tParams)).thenAnswer((_) async => Right(tTopUpResponseModel));

      // Act
      final result = await repository.getTopUps(params: tParams);

      // Assert
      expect(result, isA<RemoteResult<TopUpResponseEntity>>());
      expect(result.data, tTopUpResponse);
      verify(mockDataSource.getTopUps(params: tParams));
      verifyNoMoreInteractions(mockDataSource);
    });

    test('should return error when getting top-up options fails', () async {
      // Arrange
      when(mockDataSource.getTopUps(params: tParams)).thenAnswer((_) async => Left(error));

      // Act
      final result = await repository.getTopUps(params: tParams);

      // Assert
      expect(result.error, error);
      expect((result.hasErrorOnly), true);
      verify(mockDataSource.getTopUps(params: tParams));
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('recharge', () {
    const tBeneficiaryId = 1;
    const tRechargeAmountId = 2;
    final tTopUpEntity = TopUpEntity(amount: 20, id: tRechargeAmountId);
    final tTopUpModel = TopUpModel(amount: 20, id: tRechargeAmountId);
    final tParams = RechargeParams(beneficiaryId: tBeneficiaryId, rechargeAmountId: tRechargeAmountId);
    final error = CustomError(message: 'Failed to recharge');
    test('should return TopUpEntity when recharge is successful', () async {
      // Arrange
      when(mockDataSource.recharge(params: tParams)).thenAnswer((_) async => Right(tTopUpModel));

      // Act
      final result = await repository.recharge(params: tParams);

      // Assert
      expect(result, isA<RemoteResult<TopUpEntity>>());
      expect(result.data, tTopUpEntity);
      expect(result.hasDataOnly, true);
      verify(mockDataSource.recharge(params: tParams));
      verifyNoMoreInteractions(mockDataSource);
    });

    test('should return error when recharge fails', () async {
      // Arrange
      when(mockDataSource.recharge(params: tParams)).thenAnswer((_) async => Left(error));

      // Act
      final result = await repository.recharge(params: tParams);

      // Assert
      expect(result.hasErrorOnly, true);
      expect(result.error, error);
      verify(mockDataSource.recharge(params: tParams));
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
