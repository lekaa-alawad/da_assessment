import '../../../../core/results/result.dart';
import '../../domain/entity/transaction_entity.dart';
import '../../domain/repository/transaction_repository.dart';
import '../../domain/usecase/get_transaction_usecase.dart';
import '../data_source/transaction_remote_data_source.dart';

class ConcreteTransactionRepository extends TransactionRepository {
  final TransactionRemoteDataSource transactionRemoteDataSource;

  ConcreteTransactionRepository({required this.transactionRemoteDataSource});

  @override
  Future<Result<TransactionResponseEntity>> getTransactions({required GetTransactionsParams params}) async {
    final result = await transactionRemoteDataSource.getTransactions(params);
    return call(result: result);
  }
}
