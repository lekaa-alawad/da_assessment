// Import the required packages

import 'package:da_assessment/core/errors/custom_error.dart';
import 'package:da_assessment/feautre/transaction_history/data/data_source/transaction_remote_data_source.dart';
import 'package:da_assessment/feautre/transaction_history/data/model/transaction_model.dart';
import 'package:da_assessment/feautre/transaction_history/data/repository/concrete_transaction_repository.dart';
import 'package:da_assessment/feautre/transaction_history/domain/entity/transaction_entity.dart';
import 'package:da_assessment/feautre/transaction_history/domain/usecase/get_transaction_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'concrete_transaction_repository_test.mocks.dart';

@GenerateMocks([TransactionRemoteDataSource])
void main() {
  late ConcreteTransactionRepository repository;
  late MockTransactionRemoteDataSource mockTransactionRemoteDataSource;

  setUp(() {
    mockTransactionRemoteDataSource = MockTransactionRemoteDataSource();
    repository = ConcreteTransactionRepository(transactionRemoteDataSource: mockTransactionRemoteDataSource);
  });

  final params = GetTransactionsParams();
  final tTransactionResponseEntity = TransactionResponseEntity(transactions: []);
  final tTransactionResponseModel = TransactionResponseModel(transactions: []);

  final error = CustomError(message: 'Failed to get transactions');

  group('getTransactions', () {
    test('should get transactions from the remote data source', () async {
      // Arrange
      when(mockTransactionRemoteDataSource.getTransactions(params))
          .thenAnswer((_) async => Right(tTransactionResponseModel));
      // Act
      final result = await repository.getTransactions(params: params);

      // Assert
      expect(result.data, tTransactionResponseEntity);
      verify(mockTransactionRemoteDataSource.getTransactions(params));
      verifyNoMoreInteractions(mockTransactionRemoteDataSource);
    });

    test('should return failure when remote data source throws an exception', () async {
      // Arrange
      when(mockTransactionRemoteDataSource.getTransactions(params)).thenAnswer((_) async => Left(error));
      // Act
      final result = await repository.getTransactions(params: params);

      // Assert
      expect((result).error, error);
      verify(mockTransactionRemoteDataSource.getTransactions(params));
      verifyNoMoreInteractions(mockTransactionRemoteDataSource);
    });
  });
}
