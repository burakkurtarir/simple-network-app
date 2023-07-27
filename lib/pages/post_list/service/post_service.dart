import 'package:simple_network_app/core/network/index.dart';
import 'package:simple_network_app/pages/post_list/model/post_model.dart';
import 'package:simple_network_app/pages/post_list/service/base_post_service.dart';
import 'package:simple_network_app/product/network_urls.dart';

class PostService extends BasePostService {
  PostService() : super(NetworkService());

  @override
  Future<(List<PostModel>?, NetworkError?)> loadAllPosts() async {
    final (response, error) = await networkService.makeRequest(
      NetworkUrls.posts,
    );

    if (response != null) {
      return GenericHTTPResponseMapper.map<List<PostModel>, PostModel>(
          response, PostModel.fromJson);
    }

    return (null, error);
  }
}
