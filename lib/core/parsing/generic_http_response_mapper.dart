import 'package:simple_network_app/core/network/index.dart';
import 'package:simple_network_app/core/parsing/index.dart';

class GenericHTTPResponseMapper {
  static (R?, NetworkError?) map<R, T>(
      ResponseModel response, T Function(Map<String, dynamic> json) fromJson) {
    int statusCode = response.statusCode ?? 404;

    if (statusCode == 200) {
      final data = JSONDecoder().decode<R, T>(response.data, fromJson);
      final error = data == null ? NetworkError.decodingError() : null;

      return (data, error);
    } else {
      return (null, NetworkError.badResponse());
    }
  }
}
