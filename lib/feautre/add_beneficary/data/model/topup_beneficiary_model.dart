import 'package:da_assessment/core/models/base_model.dart';
import 'package:da_assessment/feautre/add_beneficary/domain/entity/topup_beneficiary_entity.dart';

class TopUpBeneficiaryModel extends BaseModel<TopUpBeneficiaryEntity> {
  final String nickname;
  final String phoneNumber;
  final double monthlyTopUpAmount;
  final int id;

  TopUpBeneficiaryModel({
    required this.nickname,
    required this.phoneNumber,
    this.monthlyTopUpAmount = 0.0,
    required this.id,
  });

  factory TopUpBeneficiaryModel.fromJson(Map<String, dynamic> json) {
    return TopUpBeneficiaryModel(
      nickname: json['nickname'],
      phoneNumber: json['phoneNumber'],
      monthlyTopUpAmount: json['monthlyTopUpAmount'] ?? 0.0,
      id: json['id'],
    );
  }

  @override
  TopUpBeneficiaryEntity toEntity() {
    return TopUpBeneficiaryEntity(
        id: id, nickname: nickname, phoneNumber: phoneNumber, monthlyTopUpAmount: monthlyTopUpAmount);
  }
}
