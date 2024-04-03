import 'package:da_assessment/feautre/transaction_history/data/data_source/transaction_remote_data_source.dart';
import 'package:da_assessment/feautre/transaction_history/domain/usecase/get_transaction_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/base_error.dart';
import '../../../../core/http/mock_backend.dart';
import '../../../../main.dart';
import '../model/transaction_model.dart';

class ConcreteTransactionRemoteDataSource extends TransactionRemoteDataSource {
  @override
  Future<Either<BaseError, TransactionResponseModel>> getTransactions(GetTransactionsParams params) async {
    return getIt.get<BackEndService>().getTransactions();
  }
}
