class ResponseModel {
  const ResponseModel({
    this.data,
    this.statusCode,
    this.statusMessage,
  });

  final dynamic data;
  final int? statusCode;
  final String? statusMessage;
}
