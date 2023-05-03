import 'dart:developer';

import 'package:sample_app/data_layer/common/mapper/place_holder.mapper.dart';

import '../../domain_layer/model/post/post.model.dart';
import '../../domain_layer/repository/place_holder.dart';

import '../data_source/remote/place_holder_api_sample.dart';

class PlaceHolderRepositoryImpl implements PlaceHolderRepository {
  PlaceHolderRepositoryImpl(this.placeHolderApi);

  final PlaceHolderApi placeHolderApi;

  @override
  Future<Post> getPostById({
    required String id,
    Map<String, String>? queries,
  }) async {
    final postDto = await placeHolderApi.getPostById(id: id);

    return postDto.toModel();
  }

  @override
  Future<List<Post>> getPosts({
    Map<String, String>? queries,
  }) async {
    final response = await placeHolderApi.getPosts();

    final List<Post> posts =
        response.map((postDto) => postDto.toModel()).toList();

    return posts;
  }
}
