import 'package:da_assessment/core/errors/base_error.dart';
import 'package:da_assessment/core/http/mock_backend.dart';
import 'package:da_assessment/feautre/recharge/data/data_source/topup_remote_datasource.dart';
import 'package:da_assessment/feautre/recharge/data/model/topup_model.dart';
import 'package:da_assessment/feautre/recharge/domain/usecase/get_topup_option_usecase.dart';
import 'package:da_assessment/feautre/recharge/domain/usecase/recharge_usecase.dart';
import 'package:da_assessment/main.dart';
import 'package:dartz/dartz.dart';

class ConcreteTopUpRemoteDataSource extends TopUpRemoteDataSource {
  @override
  Future<Either<BaseError, TopUpResponseModel>> getTopUps({required GetTopUpsParams params}) {
    return getIt.get<BackEndService>().getTopUp();
  }

  @override
  Future<Either<BaseError, TopUpModel>> recharge({required RechargeParams params}) {
    return getIt.get<BackEndService>().recharge(params: params);
  }
}
