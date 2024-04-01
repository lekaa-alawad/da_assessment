import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/base_model.dart';

part 'create_model_state.dart';

typedef UsecaseCallBack = Future<Either<Exception, BaseModel>>? Function(dynamic data);

class CreateModelCubit<Model> extends Cubit<CreateModelState> {
  final UsecaseCallBack getData;

  CreateModelCubit(this.getData) : super(CreateModelInitial());

  createModel({dynamic requestData}) async {
    emit(Loading());
    try {
      Either<Exception, BaseModel>? response = await getData(requestData);
      if (response != null) {
        if (response.isRight()) {
          emit(CreateModelSuccessfully(model: (response as Right<Exception, BaseModel>).value));
        } else if (response.isLeft()) {
          emit(Error(message: (response as Left<Exception, BaseModel>).value.toString()));
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
