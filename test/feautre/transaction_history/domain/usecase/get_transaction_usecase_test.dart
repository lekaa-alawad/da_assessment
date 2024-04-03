// import the required packages
import 'package:da_assessment/core/errors/custom_error.dart';
import 'package:da_assessment/core/results/result.dart';
import 'package:da_assessment/feautre/transaction_history/domain/entity/transaction_entity.dart';
import 'package:da_assessment/feautre/transaction_history/domain/repository/transaction_repository.dart';
import 'package:da_assessment/feautre/transaction_history/domain/usecase/get_transaction_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_transaction_usecase_test.mocks.dart';

@GenerateMocks([TransactionRepository])
void main() {
  late GetTransactionsUseCase useCase;
  late MockTransactionRepository mockTransactionRepository;

  setUp(() {
    mockTransactionRepository = MockTransactionRepository();
    useCase = GetTransactionsUseCase(mockTransactionRepository);
  });

  final params = GetTransactionsParams();
  final tTransactionResponseEntity = TransactionResponseEntity(transactions: []);

  final error = CustomError(message: 'Failed to get transactions');

  test('should get transactions from the repository', () async {
    // Arrange
    when(mockTransactionRepository.getTransactions(params: params))
        .thenAnswer((_) async => RemoteResult(data: tTransactionResponseEntity));

    // Act
    final result = await useCase(params: params);

    // Assert
    expect(result, isA<RemoteResult<TransactionResponseEntity>>());
    expect(result.data, tTransactionResponseEntity);
    expect(result.hasDataOnly, true);
    verify(mockTransactionRepository.getTransactions(params: params));
    verifyNoMoreInteractions(mockTransactionRepository);
  });

  test('should return error when getting transactions fails', () async {
    // Arrange
    when(mockTransactionRepository.getTransactions(params: params)).thenAnswer((_) async => RemoteResult(error: error));

    //Act
    final result = await useCase(params: params);

    //Assert
    expect((result.error), error);
    expect(result.hasErrorOnly, true);
    verify(mockTransactionRepository.getTransactions(params: params));
    verifyNoMoreInteractions(mockTransactionRepository);
  });
}
