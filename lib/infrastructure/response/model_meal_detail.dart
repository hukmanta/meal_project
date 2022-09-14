import 'package:freezed_annotation/freezed_annotation.dart';
/// meals : [{"idMeal":"52959","strMeal":"Baked salmon with fennel & tomatoes","strDrinkAlternate":null,"strCategory":"Seafood","strArea":"British","strInstructions":"Heat oven to 180C/fan 160C/gas 4. Trim the fronds from the fennel and set aside. Cut the fennel bulbs in half, then cut each half into 3 wedges. Cook in boiling salted water for 10 mins, then drain well. Chop the fennel fronds roughly, then mix with the parsley and lemon zest.\r\n\r\nSpread the drained fennel over a shallow ovenproof dish, then add the tomatoes. Drizzle with olive oil, then bake for 10 mins. Nestle the salmon among the veg, sprinkle with lemon juice, then bake 15 mins more until the fish is just cooked. Scatter over the parsley and serve.","strMealThumb":"https://www.themealdb.com/images/media/meals/1548772327.jpg","strTags":"Paleo,Keto,HighFat,Baking,LowCarbs","strYoutube":"https://www.youtube.com/watch?v=xvPR2Tfw5k0","strIngredient1":"Fennel","strIngredient2":"Parsley","strIngredient3":"Lemon","strIngredient4":"Cherry Tomatoes","strIngredient5":"Olive Oil","strIngredient6":"Salmon","strIngredient7":"Black Olives","strIngredient8":"","strIngredient9":"","strIngredient10":"","strIngredient11":"","strIngredient12":"","strIngredient13":"","strIngredient14":"","strIngredient15":"","strIngredient16":"","strIngredient17":"","strIngredient18":"","strIngredient19":"","strIngredient20":"","strMeasure1":"2 medium","strMeasure2":"2 tbs chopped","strMeasure3":"Juice of 1","strMeasure4":"175g","strMeasure5":"1 tbs","strMeasure6":"350g","strMeasure7":"to serve","strMeasure8":"","strMeasure9":"","strMeasure10":"","strMeasure11":"","strMeasure12":"","strMeasure13":"","strMeasure14":"","strMeasure15":"","strMeasure16":"","strMeasure17":"","strMeasure18":"","strMeasure19":"","strMeasure20":"","strSource":"https://www.bbcgoodfood.com/recipes/7745/baked-salmon-with-fennel-and-tomatoes","strImageSource":null,"strCreativeCommonsConfirmed":null,"dateModified":null}]

part 'model_meal_detail.freezed.dart';
part 'model_meal_detail.g.dart';

@freezed
class ModelMealDetail with _$ModelMealDetail {
  const factory ModelMealDetail({
    @Default([]) List<Meals> meals}) = _ModelMealDetail;

  factory ModelMealDetail.fromJson(Map<String, dynamic> json) => _$ModelMealDetailFromJson(json);
}
/// idMeal : "52959"
/// strMeal : "Baked salmon with fennel & tomatoes"
/// strDrinkAlternate : null
/// strCategory : "Seafood"
/// strArea : "British"
/// strInstructions : "Heat oven to 180C/fan 160C/gas 4. Trim the fronds from the fennel and set aside. Cut the fennel bulbs in half, then cut each half into 3 wedges. Cook in boiling salted water for 10 mins, then drain well. Chop the fennel fronds roughly, then mix with the parsley and lemon zest.\r\n\r\nSpread the drained fennel over a shallow ovenproof dish, then add the tomatoes. Drizzle with olive oil, then bake for 10 mins. Nestle the salmon among the veg, sprinkle with lemon juice, then bake 15 mins more until the fish is just cooked. Scatter over the parsley and serve."
/// strMealThumb : "https://www.themealdb.com/images/media/meals/1548772327.jpg"
/// strTags : "Paleo,Keto,HighFat,Baking,LowCarbs"
/// strYoutube : "https://www.youtube.com/watch?v=xvPR2Tfw5k0"
/// strIngredient1 : "Fennel"
/// strIngredient2 : "Parsley"
/// strIngredient3 : "Lemon"
/// strIngredient4 : "Cherry Tomatoes"
/// strIngredient5 : "Olive Oil"
/// strIngredient6 : "Salmon"
/// strIngredient7 : "Black Olives"
/// strIngredient8 : ""
/// strIngredient9 : ""
/// strIngredient10 : ""
/// strIngredient11 : ""
/// strIngredient12 : ""
/// strIngredient13 : ""
/// strIngredient14 : ""
/// strIngredient15 : ""
/// strIngredient16 : ""
/// strIngredient17 : ""
/// strIngredient18 : ""
/// strIngredient19 : ""
/// strIngredient20 : ""
/// strMeasure1 : "2 medium"
/// strMeasure2 : "2 tbs chopped"
/// strMeasure3 : "Juice of 1"
/// strMeasure4 : "175g"
/// strMeasure5 : "1 tbs"
/// strMeasure6 : "350g"
/// strMeasure7 : "to serve"
/// strMeasure8 : ""
/// strMeasure9 : ""
/// strMeasure10 : ""
/// strMeasure11 : ""
/// strMeasure12 : ""
/// strMeasure13 : ""
/// strMeasure14 : ""
/// strMeasure15 : ""
/// strMeasure16 : ""
/// strMeasure17 : ""
/// strMeasure18 : ""
/// strMeasure19 : ""
/// strMeasure20 : ""
/// strSource : "https://www.bbcgoodfood.com/recipes/7745/baked-salmon-with-fennel-and-tomatoes"
/// strImageSource : null
/// strCreativeCommonsConfirmed : null
/// dateModified : null

@freezed
class Meals with _$Meals {
  const factory Meals({
    String? idMeal,
    String? strMeal,
    String? strDrinkAlternate,
    String? strCategory,
    String? strArea,
    String? strInstructions,
    String? strMealThumb,
    String? strTags,
    String? strYoutube,
    String? strIngredient1,
    String? strIngredient2,
    String? strIngredient3,
    String? strIngredient4,
    String? strIngredient5,
    String? strIngredient6,
    String? strIngredient7,
    String? strIngredient8,
    String? strIngredient9,
    String? strIngredient10,
    String? strIngredient11,
    String? strIngredient12,
    String? strIngredient13,
    String? strIngredient14,
    String? strIngredient15,
    String? strIngredient16,
    String? strIngredient17,
    String? strIngredient18,
    String? strIngredient19,
    String? strIngredient20,
    String? strMeasure1,
    String? strMeasure2,
    String? strMeasure3,
    String? strMeasure4,
    String? strMeasure5,
    String? strMeasure6,
    String? strMeasure7,
    String? strMeasure8,
    String? strMeasure9,
    String? strMeasure10,
    String? strMeasure11,
    String? strMeasure12,
    String? strMeasure13,
    String? strMeasure14,
    String? strMeasure15,
    String? strMeasure16,
    String? strMeasure17,
    String? strMeasure18,
    String? strMeasure19,
    String? strMeasure20,
    String? strSource,
    String? strImageSource,
    String? strCreativeCommonsConfirmed,
    DateTime? dateModified,}) = _Meals;

  factory Meals.fromJson(Map<String, dynamic> json) => _$MealsFromJson(json);
}