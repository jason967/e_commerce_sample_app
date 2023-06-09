import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_module.dto.freezed.dart';

part 'view_module.dto.g.dart';

@freezed
class ViewModuleDto with _$ViewModuleDto {
  const factory ViewModuleDto({
    @Default('') String? type,
  }) = _ViewModuleDto;

  factory ViewModuleDto.fromJson(Map<String, Object?> json) =>
      _$ViewModuleDtoFromJson(json);
}
