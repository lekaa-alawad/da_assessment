import 'package:da_assessment/core/repositories/core_repository.dart';
import 'package:da_assessment/core/results/result.dart';
import 'package:da_assessment/feautre/transaction_history/domain/entity/transaction_entity.dart';

import '../usecase/get_transaction_usecase.dart';

abstract class TransactionRepository extends CoreRepository {
  Future<Result<TransactionResponseEntity>> getTransactions({required GetTransactionsParams params});
}
