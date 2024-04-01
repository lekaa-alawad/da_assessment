import 'package:da_assessment/core/entites/base_entity.dart';

class LoginResponseEntity extends BaseEntity {
  final String id;
  final String email;
  final String name;

  final String token;

  LoginResponseEntity(this.id, this.email, this.name, this.token);

  @override
  List<Object?> get props => [email, name, token];
}
