import '../../model/post/post.model.dart';

import '../../repository/place_holder.dart';

import '../base_usecase/remote.usecase.dart';

class GetPosts extends RemoteUsecase<PlaceHolderRepository> {
  GetPosts({this.params});
  final Map<String, String>? params;

  @override
  Future<List<Post>> execute(PlaceHolderRepository repository) async {
    final response = await repository.getPosts();
    return response;
  }
}
