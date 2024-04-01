import '../../../params/base_params.dart';

class GetListRequest extends BaseParams {
  int? page;
  int? limit;
  String? order;

  GetListRequest({this.page, this.limit, this.order});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (page != null) data['skip'] = page! > 1 ?( (page! -1) *limit!) :0;
    if (limit != null) data['limit'] = limit;
    if (order != null) data['order'] = order;
    return data;
  }
}
