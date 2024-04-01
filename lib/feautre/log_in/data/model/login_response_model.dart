import 'package:da_assessment/core/models/base_model.dart';
import 'package:da_assessment/feautre/log_in/domain/entity/login_response_entity.dart';

class LoginResponseModel extends BaseModel<LoginResponseEntity> {
  final String id;
  final String email;
  final String name;

  final String token;

  LoginResponseModel({
    required this.id,
    required this.email,
    required this.name,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      token: json['verificationStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'verificationStatus': token,
    };
  }

  @override
  LoginResponseEntity toEntity() {
    return LoginResponseEntity(id, email, name, token);
  }
}
