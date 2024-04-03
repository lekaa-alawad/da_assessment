import 'package:da_assessment/core/boilerplate/get_model/widgets/get_model.dart';
import 'package:da_assessment/core/ui/custom_appbar.dart';
import 'package:da_assessment/feautre/transaction_history/ui/widgets/transaction_tile_widget.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../data/repository/concrete_transaction_repository.dart';
import '../domain/entity/transaction_entity.dart';
import '../domain/usecase/get_transaction_usecase.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Transaction History'),
        body: GetModel(
            useCaseCallBack: () => GetTransactionsUseCase(getIt.get<ConcreteTransactionRepository>())
                .call(params: GetTransactionsParams()),
            modelBuilder: (TransactionResponseEntity model) {
              return ListView.builder(
                itemCount: model.transactions.length,
                itemBuilder: (context, index) {
                  final transaction = model.transactions[index];
                  return TransactionTile(transaction: transaction);
                },
              );
            }));
  }
}
