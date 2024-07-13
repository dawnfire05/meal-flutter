import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meal/app/modules/meals/domain/entities/meal_entity.dart';

part 'meal_model.freezed.dart';
part 'meal_model.g.dart';

@freezed
class MealModel with _$MealModel implements MealEntity {
  const MealModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MealModel({
    @JsonKey(fromJson: _stringToList) required List<String> breakfast,
    @JsonKey(fromJson: _stringToListNullable)
    required List<String>? breakfastCorner,
    @JsonKey(fromJson: _stringToList) required List<String> lunch,
    @JsonKey(fromJson: _stringToListNullable)
    required List<String>? lunchCorner,
    @JsonKey(fromJson: _stringToList) required List<String> dinner,
    @JsonKey(fromJson: _stringToListNullable)
    required List<String>? lunchRenaissance,
  }) = _MealModel;

  factory MealModel.fromJson(Map<String, dynamic> json) =>
      _$MealModelFromJson(json);
}

List<String> _stringToList(String string) {
  return string.split('\n').where((element) => element.isNotEmpty).toList();
}

List<String>? _stringToListNullable(String? string) {
  if (string == null) {
    return null;
  }
  final list = _stringToList(string);
  if (list.isEmpty) {
    return null;
  }
  return list;
}
