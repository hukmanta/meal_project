part of 'meal_bloc.dart';

@freezed
class MealEvent with _$MealEvent {
  const factory MealEvent.start() = _Start;
  const factory MealEvent.categorySelected(TableCategory category) = _CategorySelected;
  const factory MealEvent.mealDetail(TableMealDetailData detail) = _MealDetail;
}