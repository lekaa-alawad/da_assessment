import 'package:da_assessment/core/entites/base_entity.dart';
import 'package:da_assessment/feautre/add_beneficary/domain/entity/topup_beneficiary_entity.dart';

class UserEntity extends BaseEntity {
  final String id;
  final String email;
  final String name;
  final bool isVerified;
  final List<TopUpBeneficiaryEntity> topUpBeneficiaries;
  final List<TopUpBeneficiaryEntity>? historyTopUpBeneficiaries;
  final double balance;

  UserEntity({
    required this.isVerified,
    required this.topUpBeneficiaries,
    this.historyTopUpBeneficiaries,
    required this.id,
    required this.email,
    required this.name,
    required this.balance,
  });

  @override
  List<Object?> get props => [email, name, balance, isVerified, topUpBeneficiaries, id];
}
