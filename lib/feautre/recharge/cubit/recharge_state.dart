part of 'recharge_cubit.dart';

@immutable
abstract class RechargeState {}

class RechargeInitial extends RechargeState {}

class RechargeLoading extends RechargeState {}

class RechargeSuccess extends RechargeState {
  final TopUpEntity result;

  RechargeSuccess({required this.result});
}

class RechargeError extends RechargeState {
  final BaseError error;

  RechargeError({required this.error});
}
