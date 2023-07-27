import 'package:simple_network_app/core/network/index.dart';

abstract class BaseNetworkService {
  Future<(ResponseModel?, NetworkError?)> makeRequest(
    String url, {
    RequestMethod method = RequestMethod.get,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Object? data,
  });
}
