import 'package:da_assessment/core/models/base_model.dart';
import 'package:da_assessment/feautre/add_beneficary/data/model/topup_beneficiary_model.dart';
import 'package:da_assessment/feautre/home_page/domain/entity/user_entity.dart';

class UserModel extends BaseModel<UserEntity> {
  final String id;
  final String email;
  final String name;
  final double balance;
  final bool isVerified;
  final List<TopUpBeneficiaryModel> topUpBeneficiaries;
  List<TopUpBeneficiaryModel>? historyTopUpBeneficiaries;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.isVerified,
    required this.topUpBeneficiaries,
    required this.balance,
    this.historyTopUpBeneficiaries,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      historyTopUpBeneficiaries:
          (json['historyTopUpBeneficiaries']).map((e) => TopUpBeneficiaryModel.fromJson(e)).toList(),
      email: json['email'],
      name: json['name'],
      balance: json['balance'],
      isVerified: json['isVerified'],
      topUpBeneficiaries: (json['topUpBeneficiaries']).map((e) => TopUpBeneficiaryModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'balance': balance,
    };
  }

  @override
  UserEntity toEntity() {
    return UserEntity(
      isVerified: isVerified,
      historyTopUpBeneficiaries:
          historyTopUpBeneficiaries != null ? historyTopUpBeneficiaries!.map((e) => e.toEntity()).toList() : [],
      topUpBeneficiaries: topUpBeneficiaries.map((e) => e.toEntity()).toList(),
      id: id,
      email: email,
      name: name,
      balance: balance,
    );
  }
}
