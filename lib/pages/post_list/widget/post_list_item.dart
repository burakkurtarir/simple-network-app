import 'package:flutter/material.dart';
import 'package:simple_network_app/pages/post_list/model/post_model.dart';

class PostListItem extends StatelessWidget {
  final PostModel postModel;

  const PostListItem({super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(postModel.title ?? ""),
      subtitle: Text(postModel.body ?? ""),
      trailing: Text(postModel.id.toString()),
    );
  }
}
