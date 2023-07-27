import 'package:simple_network_app/core/network/index.dart';
import 'package:simple_network_app/pages/post_list/model/post_model.dart';

abstract class BasePostService {
  const BasePostService(this.networkService);

  final BaseNetworkService networkService;

  Future<(List<PostModel>?, NetworkError?)> loadAllPosts();
}
