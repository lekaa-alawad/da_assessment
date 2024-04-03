import 'package:da_assessment/core/results/result.dart';
import 'package:da_assessment/feautre/recharge/domain/entity/topup_entity.dart';
import 'package:da_assessment/feautre/recharge/domain/usecase/get_topup_option_usecase.dart';
import 'package:da_assessment/feautre/recharge/domain/usecase/recharge_usecase.dart';

import '../../domain/repository/topup_repository.dart';
import '../data_source/topup_remote_datasource.dart';

class ConcreteTopUpRepository extends TopUpRepository {
  TopUpRemoteDataSource remoteDataSource;

  ConcreteTopUpRepository({required this.remoteDataSource});

  @override
  Future<Result<TopUpResponseEntity>> getTopUps({required GetTopUpsParams params}) async {
    final result = await remoteDataSource.getTopUps(params: params);
    return call(result: result);
  }

  @override
  Future<Result<TopUpEntity>> recharge({required RechargeParams params}) async {
    final result = await remoteDataSource.recharge(params: params);
    return call(result: result);
  }
}
