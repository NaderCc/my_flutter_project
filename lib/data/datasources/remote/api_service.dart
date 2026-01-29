import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/post_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class ApiClient{
  factory ApiClient(Dio dio , {String baseUrl}) = _ApiClient;

  @GET("/posts")
  Future<List<Post>> getPosts();
}

