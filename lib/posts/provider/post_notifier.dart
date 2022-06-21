import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter/posts/model/post.dart';
import 'package:riverpod_counter/posts/repository/posts_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_notifier.freezed.dart';
part 'post_state.dart';

final postNotifierProvider = StateNotifierProvider<PostNotifier, PostState>(
    (ref) => PostNotifier(ref: ref));

class PostNotifier extends StateNotifier<PostState> {
  PostNotifier({
    required this.ref,
  }) : super(const PostState());

  Ref ref;

  Future<void> fetchPosts() async {
    final posts = await ref.read(postRepositoryProvider).loadAllPosts();

    state = state.copyWith(postsList: posts);
  }
}
