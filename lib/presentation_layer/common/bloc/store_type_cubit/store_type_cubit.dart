import 'package:flutter_bloc/flutter_bloc.dart';

enum StoreType { market, beauty }

class StoreTypeCubit extends Cubit<StoreType> {
  StoreTypeCubit() : super(StoreType.market);

  // 눌려진 버튼(스토어타입)으로 변경
  void changeStoreType(int index) => emit(StoreType.values[index]);
}
