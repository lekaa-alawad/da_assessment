import 'package:da_assessment/core/errors/custom_error.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../entites/base_entity.dart';
import '../../../results/result.dart';

part 'create_model_state.dart';

typedef UsecaseCallBack = Future<Result<BaseEntity>>? Function(dynamic data);

class CreateModelCubit<Model> extends Cubit<CreateModelState> {
  final UsecaseCallBack getData;

  CreateModelCubit(this.getData) : super(CreateModelInitial());

  createModel({dynamic requestData}) async {
    emit(Loading());
    try {
      Result<BaseEntity>? response = await getData(requestData);
      if (response != null) {
        if (response.hasDataOnly) {
          emit(CreateModelSuccessfully(model: (response).data));
        } else if (response.hasErrorOnly) {
          if (response.error is CustomError) {
            emit(Error(message: (response.error as CustomError).message.toString() ?? ''));
          } else {
            emit(Error(message: (response.error).toString() ?? ''));
          }
        } else {
          emit(Error(message: 'some thing went wrong'));
        }
      } else {
        emit(CreateModelInitial());
      }
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
