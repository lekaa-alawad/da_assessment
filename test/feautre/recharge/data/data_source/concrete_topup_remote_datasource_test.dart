import 'package:da_assessment/core/errors/base_error.dart';
import 'package:da_assessment/core/errors/custom_error.dart';
import 'package:da_assessment/feautre/recharge/data/data_source/concrete_topup_remote_datasource.dart';
import 'package:da_assessment/feautre/recharge/data/model/topup_model.dart';
import 'package:da_assessment/feautre/recharge/domain/usecase/get_topup_option_usecase.dart';
import 'package:da_assessment/feautre/recharge/domain/usecase/recharge_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'concrete_topup_remote_datasource_test.mocks.dart';

@GenerateMocks([ConcreteTopUpRemoteDataSource])
void main() {
  late MockConcreteTopUpRemoteDataSource dataSource;

  setUp(() {
    dataSource = MockConcreteTopUpRemoteDataSource();
  });

  group('getTopUps', () {
    final tTopUpResponse = TopUpResponseModel(
      topUpOptions: [
        TopUpModel(amount: 10, id: 1),
        TopUpModel(amount: 20, id: 2),
        TopUpModel(amount: 30, id: 3),
      ],
    );
    final tParams = GetTopUpsParams();
    final tError = CustomError(message: 'Failed to get top-up options');

    test('should return TopUpResponseModel when getting top-up options is successful', () async {
      // Arrange
      when(dataSource.getTopUps(params: tParams)).thenAnswer((_) async => Right(tTopUpResponse));

      // Act
      final result = await dataSource.getTopUps(params: tParams);

      // Assert
      expect(result, isA<Right<BaseError, TopUpResponseModel>>());
      expect(result.isRight(), true);
      verify(dataSource.getTopUps(params: tParams));
      verifyNoMoreInteractions(dataSource);
    });

    test('should return BaseError when getting top-up options fails', () async {
      // Arrange

      when(dataSource.getTopUps(params: tParams)).thenAnswer((_) async => Left(tError));

      // Act
      final result = await dataSource.getTopUps(params: tParams);

      // Assert
      expect(result, isA<Left<BaseError, TopUpResponseModel>>());

      expect(result.isLeft(), true);
      verify(dataSource.getTopUps(params: tParams));
      verifyNoMoreInteractions(dataSource);
    });
  });

  group('recharge', () {
    const tBeneficiaryId = 1;
    const tRechargeAmountId = 2;
    final tTopUpModel = TopUpModel(amount: 20, id: 1);
    final tParams = RechargeParams(beneficiaryId: tBeneficiaryId, rechargeAmountId: tRechargeAmountId);
    final tError = CustomError(message: 'Failed to recharge');
    test('should return TopUpModel when recharge is successful', () async {
      // Arrange
      when(dataSource.recharge(params: tParams)).thenAnswer((_) async => Right(tTopUpModel));

      // Act
      final result = await dataSource.recharge(params: tParams);

      // Assert
      expect(result, isA<Right<BaseError, TopUpModel>>());
      expect(result.isRight(), true);
      verify(dataSource.recharge(params: tParams));
      verifyNoMoreInteractions(dataSource);
    });

    test('should return BaseError when recharge fails', () async {
      // Arrange

      when(dataSource.recharge(params: tParams)).thenAnswer((_) async => Left(tError));

      // Act
      final result = await dataSource.recharge(params: tParams);

      // Assert
      expect(result, isA<Left<BaseError, TopUpModel>>());
      expect(result.isLeft(), true);
      verify(dataSource.recharge(params: tParams));
      verifyNoMoreInteractions(dataSource);
    });
  });
}
