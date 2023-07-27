part of 'post_cubit.dart';

final class PostState extends Equatable {
  const PostState({required this.posts, required this.networkState});

  final List<PostModel> posts;
  final NetworkState networkState;

  @override
  List<Object> get props => [posts, networkState];

  PostState copyWith({
    List<PostModel>? posts,
    NetworkState? networkState,
  }) {
    return PostState(
      posts: posts ?? this.posts,
      networkState: networkState ?? this.networkState,
    );
  }
}
