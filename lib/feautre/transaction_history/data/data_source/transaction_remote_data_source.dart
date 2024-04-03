import 'package:da_assessment/core/data_source/remote_data_source.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/base_error.dart';
import '../../domain/usecase/get_transaction_usecase.dart';
import '../model/transaction_model.dart';

abstract class TransactionRemoteDataSource extends RemoteDataSource {
  Future<Either<BaseError, TransactionResponseModel>> getTransactions(GetTransactionsParams params);
}
