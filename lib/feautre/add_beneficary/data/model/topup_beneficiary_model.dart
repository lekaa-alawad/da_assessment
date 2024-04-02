import 'package:da_assessment/core/models/base_model.dart';
import 'package:da_assessment/feautre/add_beneficary/domain/entity/topup_beneficiary_entity.dart';

class TopUpBeneficiaryModel extends BaseModel<TopUpBeneficiaryEntity> {
  final String nickname;
  final String phoneNumber;
  final double monthlyTopUpAmount;

  TopUpBeneficiaryModel({
    required this.nickname,
    required this.phoneNumber,
    this.monthlyTopUpAmount = 0.0,
  });

  factory TopUpBeneficiaryModel.fromJson(Map<String, dynamic> json) {
    return TopUpBeneficiaryModel(
      nickname: json['nickname'],
      phoneNumber: json['phoneNumber'],
      monthlyTopUpAmount: json['monthlyTopUpAmount'] ?? 0.0,
    );
  }

  @override
  TopUpBeneficiaryEntity toEntity() {
    return TopUpBeneficiaryEntity(nickname: nickname, phoneNumber: phoneNumber, monthlyTopUpAmount: monthlyTopUpAmount);
  }
}
