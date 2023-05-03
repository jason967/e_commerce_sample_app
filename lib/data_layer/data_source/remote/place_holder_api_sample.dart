import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

import '../../dto/place_holder_sample/post/post.dto.dart';

part 'place_holder_api_sample.g.dart';

const String baseUrl = 'https://jsonplaceholder.typicode.com/';

@RestApi(baseUrl: baseUrl)
abstract class PlaceHolderApi {
  factory PlaceHolderApi(Dio dio, {String? baseUrl}) = _PlaceHolderApi;

  @GET('/posts')
  Future<List<PostDto>> getPosts();

  @GET('/posts/{id}')
  Future<PostDto> getPostById({@Path('id') required String id});
}
