import 'package:da_assessment/core/entites/base_entity.dart';

class TransactionResponseEntity extends BaseEntity {
  final List<TransactionEntity> transactions;

  TransactionResponseEntity({required this.transactions});

  @override
  List<Object?> get props => [transactions];
}

class TransactionEntity extends BaseEntity {
  final String beneficiaryName;
  final String beneficiaryPhone;
  final String beneficiaryId;
  final String amount;
  final String date;

  TransactionEntity({
    required this.beneficiaryName,
    required this.beneficiaryPhone,
    required this.beneficiaryId,
    required this.amount,
    required this.date,
  });

  @override
  List<Object?> get props => [beneficiaryName, beneficiaryPhone, beneficiaryId, amount, date];
}
