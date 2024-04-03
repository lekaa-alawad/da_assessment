import 'package:da_assessment/feautre/transaction_history/domain/entity/transaction_entity.dart';
import 'package:da_assessment/feautre/transaction_history/domain/repository/transaction_repository.dart';

import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/usecase.dart';

class GetTransactionsParams extends BaseParams {
  GetTransactionsParams();
  toJson() {}
}

class GetTransactionsUseCase extends UseCase<TransactionResponseEntity, GetTransactionsParams> {
  final TransactionRepository repository;

  GetTransactionsUseCase(this.repository);

  @override
  Future<Result<TransactionResponseEntity>> call({required GetTransactionsParams params}) {
    return repository.getTransactions(params: params);
  }
}
