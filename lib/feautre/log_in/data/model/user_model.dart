import 'package:da_assessment/core/models/base_model.dart';
import 'package:da_assessment/feautre/log_in/domain/entity/user_entity.dart';

class UserModel extends BaseModel<UserEntity> {
  final String id;
  final String email;
  final String name;
  final int balance;
  final String verificationStatus;
  final List activeTopUp;

  UserModel(
      {required this.id,
      required this.email,
      required this.name,
      required this.balance,
      required this.verificationStatus,
      required this.activeTopUp});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      balance: json['balance'],
      verificationStatus: json['verificationStatus'],
      activeTopUp: json['activeTopUp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'balance': balance,
      'verificationStatus': verificationStatus,
      'activeTopUp': activeTopUp,
    };
  }

  @override
  UserEntity toEntity() {
    return UserEntity(id, email, name, balance, verificationStatus, activeTopUp);
  }
}
