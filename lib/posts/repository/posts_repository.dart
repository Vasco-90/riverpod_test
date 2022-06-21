import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../model/post.dart';

final postRepositoryProvider =
    Provider<PostsRepository>((ref) => PostsRepositoryImpl());

abstract class PostsRepository {
  Future<List<Post>> loadAllPosts();
}

class PostsRepositoryImpl implements PostsRepository {
  @override
  Future<List<Post>> loadAllPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    final postList = jsonDecode(response.body) as List<dynamic>;

    return postList.cast<Map<String, dynamic>>().map(Post.fromJson).toList();
  }
}
