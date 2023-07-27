import 'package:flutter/material.dart';
import 'package:simple_network_app/core/network/index.dart';
import 'package:simple_network_app/pages/post_list/cubit/post_cubit.dart';
import 'package:simple_network_app/pages/post_list/service/post_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_network_app/pages/post_list/widget/post_list_item.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(PostService()),
      child: const PostView(),
    );
  }
}

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top 100 Posts'),
        actions: [
          IconButton(
            onPressed: context.read<PostCubit>().refreshAllPosts,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          final networkState = state.networkState;

          if (networkState is LoadingState) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (networkState is SuccessState) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (ctx, index) {
                final item = state.posts[index];

                return PostListItem(postModel: item);
              },
            );
          }

          if (networkState is ErrorState) {
            return Center(child: Text(networkState.message));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
