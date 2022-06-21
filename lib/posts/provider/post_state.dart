part of 'post_notifier.dart';

@freezed
class PostState with _$PostState {
  const factory PostState({
    List<Post>? postsList,
  }) = _PostState;
}
