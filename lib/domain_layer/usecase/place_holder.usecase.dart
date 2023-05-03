import '../repository/place_holder.dart';
import 'base_usecase/remote.usecase.dart';

class PlaceHolderUsecase {
  PlaceHolderUsecase(this.placeHolderRepository);
  final PlaceHolderRepository placeHolderRepository;

  Future<dynamic> fetch(RemoteUsecase remoteUsecase) async {
    return await remoteUsecase.execute(placeHolderRepository);
  }
}
