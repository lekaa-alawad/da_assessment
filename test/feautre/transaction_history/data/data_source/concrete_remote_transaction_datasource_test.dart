import 'package:da_assessment/core/errors/base_error.dart';
import 'package:da_assessment/core/errors/custom_error.dart';
import 'package:da_assessment/feautre/transaction_history/data/data_source/concrete_transaction_remote_datasource.dart';
import 'package:da_assessment/feautre/transaction_history/data/model/transaction_model.dart';
import 'package:da_assessment/feautre/transaction_history/domain/usecase/get_transaction_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'concrete_remote_transaction_datasource_test.mocks.dart';

@GenerateMocks([ConcreteTransactionRemoteDataSource])
void main() {
  late ConcreteTransactionRemoteDataSource dataSource;

  setUp(() {
    dataSource = MockConcreteTransactionRemoteDataSource();
  });
  final tTransactionsModel = TransactionResponseModel(transactions: []);

  final tParams = GetTransactionsParams();
  final error = CustomError(message: 'can\'t get Data');

  group('ConcreteTransactionsRemoteDataSource', () {
    test('should return TransactionsModel when getting Transactions data is successful', () async {
      // Arrange
      when(dataSource.getTransactions(tParams)).thenAnswer((_) async => Right(tTransactionsModel));

      // Act
      final result = await dataSource.getTransactions(tParams);

      // Assert

      verify(dataSource.getTransactions(tParams));
      verifyNoMoreInteractions(dataSource);
      expect(result, isA<Right<BaseError, TransactionResponseModel>>());

      verifyNoMoreInteractions(dataSource);
    });

    test('should return BaseError when getting Transactions data fails', () async {
      // Arrange

      when(dataSource.getTransactions(tParams)).thenAnswer((_) async => Left(error));

      // Act
      final result = await dataSource.getTransactions(tParams);

      // Assert

      expect(result, isA<Left<BaseError, TransactionResponseModel>>());
      expect(result.isLeft(), true);
      verify(dataSource.getTransactions(tParams));
      verifyNoMoreInteractions(dataSource);
    });
  });
}
