import '../errors/base_error.dart';

class Result<Data> {
  final Data? data;
  final BaseError? error;
  final bool? isLocalResult;
  Result({this.data, this.error, this.isLocalResult}) : assert(data != null || error != null);

  bool get hasDataOnly => data != null && error == null;

  bool get hasErrorOnly => data == null && error != null;

  bool get hasDataAndError => data != null && error != null;
}

class RemoteResult<Data> extends Result<Data> {
  RemoteResult({super.data, super.error}) : super(isLocalResult: false);
}

class LocalResult<Data> extends Result<Data> {
  LocalResult({super.data, super.error}) : super(isLocalResult: false);
}
