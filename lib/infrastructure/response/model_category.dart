// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_category.freezed.dart';
part 'model_category.g.dart';

@freezed
class ModelCategory with _$ModelCategory {
  const factory ModelCategory({@Default([]) List<Categories> categories}) = _ModelCategory;
  factory ModelCategory.fromJson(Map<String, dynamic> json) => _$ModelCategoryFromJson(json);
}

@freezed
class Categories with _$Categories {
  const factory Categories({@Default('') String idCategory,
  @Default('') String strCategory,
  @Default('') String strCategoryThumb,
  @Default('') String strCategoryDescription}) = _Categories;

  factory Categories.fromJson(Map<String, dynamic> json) => _$CategoriesFromJson(json);
}