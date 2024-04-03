import 'package:da_assessment/core/models/base_model.dart';
import 'package:da_assessment/feautre/add_beneficary/domain/entity/topup_beneficiary_entity.dart';

class TopUpBeneficiaryModel extends BaseModel<TopUpBeneficiaryEntity> {
  final String nickname;
  final String phoneNumber;
  int monthlyTopUpAmount;
  final int id;
  DateTime lastTransaction;

  TopUpBeneficiaryModel({
    required this.nickname,
    required this.phoneNumber,
    this.monthlyTopUpAmount = 0,
    required this.id,
    required this.lastTransaction,
  });

  factory TopUpBeneficiaryModel.fromJson(Map<String, dynamic> json) {
    return TopUpBeneficiaryModel(
      nickname: json['nickname'],
      lastTransaction: DateTime.parse(json['lastTransaction']),
      phoneNumber: json['phoneNumber'],
      monthlyTopUpAmount: json['monthlyTopUpAmount'] ?? 0,
      id: json['id'],
    );
  }

  @override
  TopUpBeneficiaryEntity toEntity() {
    return TopUpBeneficiaryEntity(
        lastTransaction: lastTransaction,
        id: id,
        nickname: nickname,
        phoneNumber: phoneNumber,
        monthlyTopUpAmount: monthlyTopUpAmount);
  }
}
