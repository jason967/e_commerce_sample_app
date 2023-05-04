import '../repository/place_holder.dart';
import 'base_usecase/remote.usecase.dart';

class PlaceHolderUsecase {
  PlaceHolderUsecase(this._placeHolderRepository);
  final PlaceHolderRepository _placeHolderRepository;

  Future<dynamic> fetch(RemoteUsecase remoteUsecase) async {
    return await remoteUsecase.execute(_placeHolderRepository);
  }
}
