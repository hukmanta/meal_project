part of 'meal_bloc.dart';

@freezed
class MealState with _$MealState {
   const factory MealState({
       required bool isLoading,
      required List<TableCategory> categories,
      required List<TableMealDetailData> mealDetail,
      required List<TableMealDetailData> favoriteMeal,
      TableMealDetailData? selectedDetail,
     TableCategory? selectedCategory
}) = _MealState;
  factory MealState.initial() => const MealState(isLoading: false, categories: [], mealDetail: [], favoriteMeal: []);

}