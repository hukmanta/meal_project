import 'package:drift/drift.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meal_project/domain/i_meal_repository.dart';
import 'package:meal_project/domain/i_meal_service.dart';
import 'package:meal_project/infrastructure/local_db/database.dart';
import 'package:meal_project/infrastructure/response/model_category.dart';
import 'package:meal_project/infrastructure/response/model_meal_detail.dart';
import 'package:meal_project/simple_bloc_delegate.dart';

class MealRepository extends IMealRepository {
  final IMealService service;
  final Database db;

  MealRepository({required this.service, required this.db});

  @override
  Future<List<TableCategory>> getCategoriesFromDb() async {
    List<TableCategory> result = [];
    try {
      return db.allItemsCategory;
    } catch (e, s) {
      Modular.get<SimpleBlocObserver>().logger.e(e.toString(), s);
    }
    return Future.value(result);
  }

  @override
  Future<bool> getCategoriesFromService() async {
    try {
      var x = await service.getHttp(path: 'categories.php');
      var y = ModelCategory.fromJson(x);
      if (y.categories.isNotEmpty) {
        for (var element in y.categories) {
          await db.into(db.tableCategories).insert(TableCategoriesCompanion.insert(
              idCategory: int.parse(element.idCategory),
              strCategory: element.strCategory,
              strCategoryThumb: element.strCategoryThumb,
              strCategoryDescription: element.strCategoryDescription));
        }
      }
      return Future.value(true);
    } catch (e, s) {
      Modular.get<SimpleBlocObserver>().logger.e(e.toString(), s);
      return Future.value(false);
    }
  }

  @override
  Future<bool> getMealDetailByIdFromService(String id) async {
    try {
      // ignore: prefer_single_quotes
      var x = await service.getHttp(path: 'lookup.php', queryParameter: {"i": id});
      var y = ModelMealDetail.fromJson(x);
      if (y.meals.isNotEmpty) {
        for (var element in y.meals) {
          if (element.idMeal != null) {
            await db.into(db.tableMealDetail).insert(TableMealDetailCompanion.insert(
                mealId: int.parse(element.idMeal!),
                strMeal: element.strMeal ?? '',
                strCategory: element.strCategory ?? '',
                strArea: Value(element.strArea ?? ''),
                strInstructions: Value(element.strInstructions ?? ''),
                strMealThumb: Value(element.strMealThumb ?? ''),
                strTags: Value(element.strTags ?? ''),
                strYoutube: Value(element.strYoutube ?? ''),
                strIngredient1: Value(element.strIngredient1 ?? ''),
                strIngredient2: Value(element.strIngredient2 ?? ''),
                strIngredient3: Value(element.strIngredient3 ?? ''),
                strIngredient4: Value(element.strIngredient4 ?? ''),
                strIngredient5: Value(element.strIngredient5 ?? ''),
                strIngredient6: Value(element.strIngredient6 ?? ''),
                strIngredient7: Value(element.strIngredient7 ?? ''),
                strIngredient8: Value(element.strIngredient8 ?? ''),
                strIngredient9: Value(element.strIngredient9 ?? ''),
                strIngredient10: Value(element.strIngredient10 ?? ''),
                strIngredient11: Value(element.strIngredient11 ?? ''),
                strIngredient12: Value(element.strIngredient12 ?? ''),
                strIngredient13: Value(element.strIngredient13 ?? ''),
                strIngredient14: Value(element.strIngredient14 ?? ''),
                strIngredient15: Value(element.strIngredient15 ?? ''),
                strIngredient16: Value(element.strIngredient16 ?? ''),
                strIngredient17: Value(element.strIngredient17 ?? ''),
                strIngredient18: Value(element.strIngredient18 ?? ''),
                strIngredient19: Value(element.strIngredient19 ?? ''),
                strIngredient20: Value(element.strIngredient20 ?? ''),
                strMeasure1: Value(element.strMeasure1 ?? ''),
                strMeasure2: Value(element.strMeasure2 ?? ''),
                strMeasure3: Value(element.strMeasure3 ?? ''),
                strMeasure4: Value(element.strMeasure4 ?? ''),
                strMeasure5: Value(element.strMeasure5 ?? ''),
                strMeasure6: Value(element.strMeasure6 ?? ''),
                strMeasure7: Value(element.strMeasure7 ?? ''),
                strMeasure8: Value(element.strMeasure8 ?? ''),
                strMeasure9: Value(element.strMeasure9 ?? ''),
                strMeasure10: Value(element.strMeasure10 ?? ''),
                strMeasure11: Value(element.strMeasure11 ?? ''),
                strMeasure12: Value(element.strMeasure12 ?? ''),
                strMeasure13: Value(element.strMeasure13 ?? ''),
                strMeasure14: Value(element.strMeasure14 ?? ''),
                strMeasure15: Value(element.strMeasure15 ?? ''),
                strMeasure16: Value(element.strMeasure16 ?? ''),
                strMeasure17: Value(element.strMeasure17 ?? ''),
                strMeasure18: Value(element.strMeasure18 ?? ''),
                strMeasure19: Value(element.strMeasure19 ?? ''),
                strMeasure20: Value(element.strMeasure20 ?? ''),
                strSource: Value(element.strSource ?? ''),
                dateModified: Value(element.dateModified)));
          }
        }
      }
      return Future.value(true);
    } catch (e, s) {
      Modular.get<SimpleBlocObserver>().logger.e(e.toString(), s);
      return Future.value(false);
    }
  }

  @override
  Future<List<TableMealDetailData>> getItemMealDetailFromDb(int id) {
    List<TableMealDetailData> result = [];
    try {
      return db.itemsMealDetailById(id);
    } catch (e, s) {
      Modular.get<SimpleBlocObserver>().logger.e(e.toString(), s);
    }
    return Future.value(result);
  }

  @override
  Future<bool> getMealByCategoryFromService(String category) async {
    try {
      var x = await service.getHttp(path: 'filter.php', queryParameter: {'c': category});
      var y = ModelMealDetail.fromJson(x);
      if (y.meals.isNotEmpty) {
        for (var element in y.meals) {
          var queryResult = (db.select(db.tableMealDetail)..where((tbl) => tbl.mealId.equals(int.parse(element.idMeal ?? '0')))).get();
          if ((element.idMeal != null || element.strMeal != null || element.strMealThumb != null) && (await queryResult).isEmpty) {
            await db.into(db.tableMealDetail).insert(TableMealDetailCompanion.insert(
                mealId: int.parse(element.idMeal!), strCategory: category, strMealThumb: Value(element.strMealThumb ?? ''), strMeal: element.strMeal ?? ''));
          }
        }
      }
      return Future.value(true);
    } catch (e, s) {
      Modular.get<SimpleBlocObserver>().logger.e(e.toString(), s);
      return Future.value(false);
    }
  }

  @override
  Future updateItemMealDetailToDb(TableMealDetailData data) {
    try {
      return db.updateMealDetailById(data);
    } catch (e, s) {
      Modular.get<SimpleBlocObserver>().logger.e(e.toString(), s);
    }
    return Future.value(null);
  }

  @override
  Future<List<TableMealDetailData>> getItemMealByCategoriesFromDb(String category) {
    List<TableMealDetailData> result = [];
    try {
      return db.allItemsMealByCategory(category);
    } catch (e, s) {
      Modular.get<SimpleBlocObserver>().logger.e(e.toString(), s);
    }
    return Future.value(result);
  }
}