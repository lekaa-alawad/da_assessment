part of 'home_page_cubit.dart';

abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class UpdateUserState extends HomePageState {
  UpdateUserState();
}

class GetUserLoadingState extends HomePageState {
  GetUserLoadingState();
}

class GetUserSuccessState extends HomePageState {
  GetUserSuccessState();
}

class GetUserErrorState extends HomePageState {
  final BaseError error;
  GetUserErrorState({required this.error});
}
