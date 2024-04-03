import 'package:da_assessment/feautre/add_beneficary/domain/entity/topup_beneficiary_entity.dart';
import 'package:da_assessment/feautre/home_page/domain/entity/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/errors/base_error.dart';
import '../../../main.dart';
import '../data/repository/concrete_user_repository.dart';
import '../domain/usecase/get_user_data_usecase.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  late UserEntity userEntity;

  setUser(UserEntity user) {
    userEntity = user;
  }

  getUser() async {
    emit(GetUserLoadingState());
    final result = await GetUserUseCase(getIt.get<ConcreteUserRepository>()).call(params: GetUserParams());
    if (result.hasDataOnly) {
      userEntity = result.data!;
      emit(GetUserSuccessState());
    } else {
      emit(GetUserErrorState(error: result.error!));
    }
  }

  updateUser(UserEntity user) {
    userEntity = user;
    emit(UpdateUserState());
  }

  addBeneficiary(TopUpBeneficiaryEntity beneficiary) {
    if (userEntity.topUpBeneficiaries.length < 5) {
      userEntity.topUpBeneficiaries.add(beneficiary);
    }
    emit(UpdateUserState());
  }

  // (bool, String) checkRechargeValidation({required int beneficiaryId, required int rechargeAmount}) {
  //   RechargeValidator validator = RechargeValidator(userEntity: userEntity);
  //   return validator.validateRecharge(beneficiaryId: beneficiaryId, rechargeAmount: rechargeAmount);
  // }

  get beneficiariesTotalAmount =>
      userEntity.topUpBeneficiaries.fold(0, (sum, element) => sum + element.monthlyTopUpAmount);

  resetBeneficiariesAmount() {
    for (var element in userEntity.topUpBeneficiaries) {
      element.monthlyTopUpAmount = 0;
    }
  }

  refreshUser() {
    emit(UpdateUserState());
  }
}
