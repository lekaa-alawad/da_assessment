import 'package:da_assessment/core/errors/base_error.dart';
import 'package:da_assessment/feautre/log_in/data/model/user_model.dart';
import 'package:dartz/dartz.dart';

class MockBackEnd {
  static UserModel userModel = UserModel(
      id: '1',
      email: 'lekaa.alawad@gmail.com'
          '',
      name: 'leka',
      balance: 1000,
      verificationStatus: '1',
      activeTopUp: []);

  static Future<Either<BaseError, Data>> login<Data>() async {
    return Right(userModel as Data);
  }
}
