import 'package:da_assessment/core/models/base_model.dart';
import 'package:da_assessment/feautre/recharge/domain/entity/topup_entity.dart';

class TopUpResponseModel extends BaseModel<TopUpResponseEntity> {
  final List<TopUpModel> topUpOptions;

  TopUpResponseModel({required this.topUpOptions});

  factory TopUpResponseModel.fromJson(Map<String, dynamic> json) {
    return TopUpResponseModel(
      topUpOptions: List<TopUpModel>.from(json['topUpOptions'].map((model) => TopUpModel.fromJson(model))),
    );
  }

  @override
  TopUpResponseEntity toEntity() {
    return TopUpResponseEntity(topUpOptions: topUpOptions.map((model) => model.toEntity()).toList());
  }
}

class TopUpModel extends BaseModel<TopUpEntity> {
  final int id;
  final int amount;

  TopUpModel({required this.id, required this.amount});

  factory TopUpModel.fromJson(Map<String, dynamic> json) {
    return TopUpModel(
      id: json['id'],
      amount: json['amount'],
    );
  }

  @override
  TopUpEntity toEntity() {
    return TopUpEntity(id: id, amount: amount);
  }
}
