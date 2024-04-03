import 'package:da_assessment/core/models/base_model.dart';
import 'package:da_assessment/feautre/transaction_history/domain/entity/transaction_entity.dart';
import 'package:intl/intl.dart';

class TransactionResponseModel extends BaseModel<TransactionResponseEntity> {
  final List<TransactionModel> transactions;

  TransactionResponseModel({required this.transactions});

  factory TransactionResponseModel.fromJson(List<dynamic> json) {
    return TransactionResponseModel(
      transactions: json.map((e) => TransactionModel.fromJson(e)).toList(),
    );
  }

  @override
  TransactionResponseEntity toEntity() {
    return TransactionResponseEntity(transactions: transactions.map((model) => model.toEntity()).toList());
  }
}

class TransactionModel extends BaseModel<TransactionEntity> {
  final String beneficiaryName;
  final String beneficiaryPhone;
  final String beneficiaryId;
  final String amount;
  final String date;

  TransactionModel({
    required this.beneficiaryName,
    required this.beneficiaryPhone,
    required this.beneficiaryId,
    required this.amount,
    required this.date,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    final dateFormat = DateFormat('yy/MM/dd hh:mm');
    final formattedDate = dateFormat.format(DateTime.parse(json['date']));
    return TransactionModel(
      beneficiaryName: json['beneficiaryName'],
      beneficiaryPhone: json['beneficiaryPhone'],
      beneficiaryId: json['beneficiaryId'],
      amount: json['amount'],
      date: formattedDate,
    );
  }

  @override
  TransactionEntity toEntity() {
    return TransactionEntity(
      beneficiaryName: beneficiaryName,
      beneficiaryPhone: beneficiaryPhone,
      beneficiaryId: beneficiaryId,
      amount: amount,
      date: date,
    );
  }
}
