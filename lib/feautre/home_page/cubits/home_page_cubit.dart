import 'package:bloc/bloc.dart';
import 'package:da_assessment/feautre/add_beneficary/domain/entity/topup_beneficiary_entity.dart';
import 'package:da_assessment/feautre/home_page/domain/entity/user_entity.dart';
import 'package:meta/meta.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  late UserEntity userEntity;

  setUser(UserEntity user) {
    userEntity = user;
  }

  addBeneficiary(TopUpBeneficiaryEntity beneficiary) {
    if (userEntity.topUpBeneficiaries.length < 5) {
      userEntity.topUpBeneficiaries.add(beneficiary);
    }
    emit(UpdateUserState());
  }
}
