import '../../../domain_layer/model/post/post.model.dart';
import '../../dto/place_holder_sample/post/post.dto.dart';

extension PostEx on PostDto {
  Post toModel() {
    return Post(
      userId: userId ?? 0,
      id: id ?? 0,
      title: title ?? '',
      body: body ?? '',
    );
  }
}
