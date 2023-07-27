import 'package:dio/dio.dart';
import 'package:simple_network_app/core/network/index.dart';

class NetworkService with DioMixin implements BaseNetworkService, Dio {
  NetworkService() {
    options = BaseOptions();
    httpClientAdapter = HttpClientAdapter();
  }

  @override
  Future<(ResponseModel?, NetworkError?)> makeRequest(
    String url, {
    RequestMethod method = RequestMethod.get,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Object? data,
  }) async {
    try {
      final response = await request(
        url,
        queryParameters: queryParameters,
        data: data,
        options: Options(method: method.rawValue, headers: headers),
      );

      final responseModel = response.toResponseModel();

      return (responseModel, null);
    } on DioException catch (e) {
      final responseModel = e.response.toResponseModel();
      final error = e.toNetworkError();

      return (responseModel, error);
    } catch (e) {
      return (null, NetworkError.unknown());
    }
  }
}
