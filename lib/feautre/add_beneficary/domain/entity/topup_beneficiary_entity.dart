import '../../../../core/entites/base_entity.dart';

class TopUpBeneficiaryEntity extends BaseEntity {
  final String nickname;
  final String phoneNumber;
  final double monthlyTopUpAmount;
  final int id;

  TopUpBeneficiaryEntity({
    required this.nickname,
    required this.phoneNumber,
    required this.monthlyTopUpAmount,
    required this.id,
  });

  @override
  List<Object?> get props => [nickname, phoneNumber, id];
}
