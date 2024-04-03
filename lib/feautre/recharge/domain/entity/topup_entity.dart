import 'package:da_assessment/core/entites/base_entity.dart';

class TopUpResponseEntity extends BaseEntity {
  TopUpResponseEntity({required this.topUpOptions});

  final List<TopUpEntity> topUpOptions;

  @override
  List<Object?> get props => [topUpOptions];
}

class TopUpEntity extends BaseEntity {
  final int id;
  final int amount;

  TopUpEntity({required this.id, required this.amount});

  @override
  List<Object?> get props => [
        id,
        amount,
      ];
}
