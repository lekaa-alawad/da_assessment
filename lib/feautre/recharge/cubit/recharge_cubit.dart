import 'package:da_assessment/core/errors/custom_error.dart';
import 'package:da_assessment/feautre/home_page/domain/entity/user_entity.dart';
import 'package:da_assessment/feautre/recharge/domain/entity/recharge_validator_result.dart';
import 'package:da_assessment/feautre/recharge/domain/entity/topup_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/errors/base_error.dart';
import '../../../core/ui/dialogs/dialogs.dart';
import '../../../main.dart';
import '../data/repository/concrete_topup_repository.dart';
import '../domain/usecase/recharge_usecase.dart';
import '../domain/utils/recharge_validator.dart';

part 'recharge_state.dart';

class RechargeCubit extends Cubit<RechargeState> {
  RechargeCubit() : super(RechargeInitial());

  recharge({required int beneficiaryId, TopUpEntity? rechargeAmount, required UserEntity userEntity}) async {
    emit(RechargeLoading());
    if (rechargeAmount == null) {
      Dialogs.showErrorSnackBar(message: 'Please select recharge amount');
      emit(RechargeError(error: CustomError(message: 'Please select recharge amount')));
    } else {
      final RechargeValidatorResult result = RechargeValidator(userEntity: userEntity).validateRecharge(
        beneficiaryId: beneficiaryId,
        rechargeAmount: rechargeAmount.amount,
      );
      if (result.isValid) {
        final apiResult = await RechargeUseCase(getIt.get<ConcreteTopUpRepository>()).call(
          params: RechargeParams(
            beneficiaryId: beneficiaryId,
            rechargeAmountId: rechargeAmount.id,
          ),
        );
        if (apiResult.hasDataOnly) {
          emit(RechargeSuccess(result: apiResult.data!));
        } else {
          emit(RechargeError(error: apiResult.error!));
        }
      } else {
        Dialogs.showErrorSnackBar(message: result.message);
        emit(RechargeError(error: CustomError(message: result.message)));
      }
    }
  }
}
