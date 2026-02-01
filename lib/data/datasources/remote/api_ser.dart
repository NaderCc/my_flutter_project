import 'package:dio/dio.dart';

import '../../models/post_model.dart';

class ApiSer {
  final Dio dio;

  ApiSer(this.dio,);

  Future<List<Post>> getPosts() async {
    try {
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/posts',
        options: Options(
          headers: {
            'User-Agent': 'Dio/Flutter',
            'Accept': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        return (response.data as List).map((e) => Post.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw Exception('Failed to load posts');
    }
  }
}
