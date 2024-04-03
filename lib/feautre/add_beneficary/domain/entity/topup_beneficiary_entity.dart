import '../../../../core/entites/base_entity.dart';

class TopUpBeneficiaryEntity extends BaseEntity {
  final String nickname;
  final String phoneNumber;
  int monthlyTopUpAmount;
  final int id;
  final DateTime lastTransaction;

  TopUpBeneficiaryEntity({
    required this.nickname,
    required this.phoneNumber,
    required this.monthlyTopUpAmount,
    required this.id,
    required this.lastTransaction,
  });

  @override
  List<Object?> get props => [nickname, phoneNumber, id];
}
