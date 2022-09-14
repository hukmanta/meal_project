import 'package:drift/drift.dart';


@DataClassName('TableCategory')
class TableCategories extends Table {
   IntColumn get idCategory => integer()();
    TextColumn get strCategory => text()();
    TextColumn get strCategoryThumb => text()();
    TextColumn get strCategoryDescription => text()();
}