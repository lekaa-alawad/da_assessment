import 'package:da_assessment/core/data_source/remote_data_source.dart';
import 'package:da_assessment/feautre/recharge/domain/usecase/recharge_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/base_error.dart';
import '../../domain/usecase/get_topup_option_usecase.dart';
import '../model/topup_model.dart';

abstract class TopUpRemoteDataSource extends RemoteDataSource {
  Future<Either<BaseError, TopUpResponseModel>> getTopUps({required GetTopUpsParams params});

  Future<Either<BaseError, TopUpModel>> recharge({required RechargeParams params});
}
