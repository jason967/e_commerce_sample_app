import 'package:sample_app/domain_layer/repository/repository.dart';

import '../model/post/post.model.dart';

abstract class PlaceHolderRepository extends Repository {
  // get post list
  Future<List<Post>> getPosts({
    Map<String, String>? queries,
  });

  //get post single value
  Future<Post> getPostById({
    required String id,
    Map<String, String>? queries,
  });
}
