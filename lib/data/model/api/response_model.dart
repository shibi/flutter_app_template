class ResponseModel{
  final bool _isSuccess;
  final String _message;
  final String _data;

  ResponseModel(this._isSuccess, this._message, this._data);

  bool get isSuccess => _isSuccess;
  String get message => _message;
  String get data => _data;

}