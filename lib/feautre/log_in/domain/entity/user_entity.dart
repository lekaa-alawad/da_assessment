import 'package:da_assessment/core/entites/base_entity.dart';

class UserEntity extends BaseEntity {
  final String id;
  final String email;
  final String name;
  final int balance;
  final String verificationStatus;
  final List activeTopUp;

  UserEntity(this.id, this.email, this.name, this.balance, this.verificationStatus, this.activeTopUp);

  @override
  List<Object?> get props => [email, name, balance, verificationStatus, activeTopUp];
}