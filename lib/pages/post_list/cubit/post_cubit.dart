import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_network_app/core/network/network_state.dart';
import 'package:simple_network_app/pages/post_list/model/post_model.dart';
import 'package:simple_network_app/pages/post_list/service/base_post_service.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(this._postService)
      : super(const PostState(posts: [], networkState: InitialState())) {
    loadAllPosts();
  }

  final BasePostService _postService;

  Future<void> loadAllPosts() async {
    emit(state.copyWith(networkState: const LoadingState()));
    // Fake delay
    await Future.delayed(const Duration(seconds: 2));

    final (data, error) = await _postService.loadAllPosts();

    if (data != null) {
      emit(state.copyWith(posts: data, networkState: const SuccessState()));
    } else {
      emit(state.copyWith(networkState: ErrorState(error?.message)));
    }
  }

  Future<void> refreshAllPosts() async {
    if (state.networkState is LoadingState) return;

    loadAllPosts();
  }
}
