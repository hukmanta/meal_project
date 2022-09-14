import 'package:meal_project/infrastructure/local_db/database.dart';

abstract class IMealRepository{
  Future<bool> getCategoriesFromService();
  Future<bool> getMealByCategoryFromService(String category);
  Future<bool> getMealDetailByIdFromService(String id);
  Future<List<TableCategory>> getCategoriesFromDb();
  Future<List<TableMealDetailData>> getItemMealByCategoriesFromDb(String category);
  Future<List<TableMealDetailData>> getItemMealDetailFromDb(int id);
  Future updateItemMealDetailToDb(TableMealDetailData data);
}