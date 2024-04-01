import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/base_model.dart';
import '../models/get_list_request.dart';

part 'pagination_state.dart';

typedef RepositoryCallBack = Future<Either<Exception, List<BaseModel>>>? Function(dynamic data);

class PaginationCubit<ListModel> extends Cubit<PaginationState> {
  final RepositoryCallBack getData;

  PaginationCubit(this.getData) : super(PaginationInitial());
  List<ListModel> list = [];
  Map<String, dynamic> params = {};
  int limit = 10;
  int page = 1;
  String order = 'asc';

  getList({bool loadMore = false}) async {
    if (!loadMore) {
      page = 1;
      emit(Loading());
    } else {
      page++;
    }

    var requestData = GetListRequest(
      limit: limit,
      page: page,
      order: order,
    );
    var response = await getData(requestData);

    if (response == null) {
      emit(PaginationInitial());
    } else {
      if (response.isRight()) {
        if (loadMore) {
          list.addAll((response as Right<Exception, List<BaseModel>>).value as List<ListModel>);
        } else {
          list = (response as Right<Exception, List<BaseModel>>).value as List<ListModel>;
        }

        emit(GetListSuccessfully(
            list: list.toList(), noMoreData: (((response).value) as List<ListModel>).isEmpty && loadMore));
      } else if (response.isLeft()) {
        emit(Error((response as Left<Exception, List<BaseModel>>).value.toString()));
        //emit(Error('Some Thing went wrong'));
      } else {
        emit(PaginationInitial());
      }
    }
  }
}
