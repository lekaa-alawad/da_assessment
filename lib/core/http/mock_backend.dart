import 'package:da_assessment/core/errors/base_error.dart';
import 'package:da_assessment/feautre/log_in/data/model/login_response_model.dart';
import 'package:dartz/dartz.dart';

class BackEndService {
  static LoginResponseModel userModel = LoginResponseModel(
    id: '1',
    email: 'lekaa.alawad@gmail.com',
    name: 'leka',
    token: 'token',
  );

  static Future<Either<BaseError, Data>> login<Data>() async {
    return Right(userModel as Data);
  }
}
