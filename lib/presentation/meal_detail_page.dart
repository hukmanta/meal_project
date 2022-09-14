import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:iconsax/iconsax.dart';
import 'package:meal_project/application/meal_bloc.dart';
import 'package:meal_project/extension.dart';
import 'package:meal_project/presentation/my_image.dart';

class MealDetailPage extends StatelessWidget {
  const MealDetailPage({Key? key, String? category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MealBloc, MealState>(
        bloc: Modular.get<MealBloc>(),
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                width: context.width,
                child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: getIngredients(state, context))
                    .marginOnly(top: pixelToDp(context, 70), left: pixelToDp(context, 70), right: pixelToDp(context, 70)),
              ),
            ),
            bottomNavigationBar: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: Offset(1, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: BottomNavigationBar(
                        currentIndex: 0,
                        elevation: 10,
                        backgroundColor: Colors.indigo,
                        unselectedItemColor: Colors.amber.withAlpha(100),
                        items: const [
                          BottomNavigationBarItem(icon: Icon(Iconsax.grid_25), label: 'Meal'),
                          BottomNavigationBarItem(icon: Icon(Iconsax.notification_favorite), label: 'Favorite Meal')
                        ]))),
          );
        });
  }

  List<Widget> getIngredients(MealState state, BuildContext context) {
    List<Widget> result = [];
    result.add(SizedBox(
            height: pixelToDp(context, 500),
            width: context.widthTransformer(dividedBy: 1, reducedBy: pixelToDp(context, 40)),
            child: MyImage(path: state.selectedDetail?.strMealThumb ?? ''))
        .paddingAll(defaultMargin(context)));
    result.add(Text("Name: ${state.selectedDetail?.strMeal ?? ''}", style: const TextStyle(fontSize: 16)));
    result.add(Text("Category: ${state.selectedDetail?.strCategory ?? ''}", style: const TextStyle(fontSize: 16)).paddingSymmetric(vertical: 8));
    result.add(Text("Area/Origin: ${state.selectedDetail?.strArea ?? ''}", style: const TextStyle(fontSize: 16)));
    result.add(const Text('Ingredients: ', style: TextStyle(fontSize: 16)).paddingSymmetric(vertical: 8));
    if ((state.selectedDetail?.strIngredient1 ?? '').isNotEmpty) {
      result.add(Text('${state.selectedDetail?.strMeasure1} ${state.selectedDetail?.strIngredient1}', style: const TextStyle(fontSize: 16)));
    }
    if ((state.selectedDetail?.strIngredient2 ?? '').isNotEmpty) {
      result.add(Text('${state.selectedDetail?.strMeasure2} ${state.selectedDetail?.strIngredient2}', style: const TextStyle(fontSize: 16)));
    }
    if ((state.selectedDetail?.strIngredient3 ?? '').isNotEmpty) {
      result.add(Text('${state.selectedDetail?.strMeasure3} ${state.selectedDetail?.strIngredient3}', style: const TextStyle(fontSize: 16)));
    }
    if ((state.selectedDetail?.strIngredient4 ?? '').isNotEmpty) {
      result.add(Text('${state.selectedDetail?.strMeasure4} ${state.selectedDetail?.strIngredient4}', style: const TextStyle(fontSize: 16)));
    }
    if ((state.selectedDetail?.strIngredient5 ?? '').isNotEmpty) {
      result.add(Text('${state.selectedDetail?.strMeasure5} ${state.selectedDetail?.strIngredient5}', style: const TextStyle(fontSize: 16)));
    }
    if ((state.selectedDetail?.strIngredient6 ?? '').isNotEmpty) {
      result.add(Text('${state.selectedDetail?.strMeasure6} ${state.selectedDetail?.strIngredient6}', style: const TextStyle(fontSize: 16)));
    }
    if ((state.selectedDetail?.strIngredient7 ?? '').isNotEmpty) {
      result.add(Text('${state.selectedDetail?.strMeasure7} ${state.selectedDetail?.strIngredient7}', style: const TextStyle(fontSize: 16)));
    }
    if ((state.selectedDetail?.strIngredient8 ?? '').isNotEmpty) {
      result.add(Text('${state.selectedDetail?.strMeasure8} ${state.selectedDetail?.strIngredient8}', style: const TextStyle(fontSize: 16)));
    }
    if ((state.selectedDetail?.strIngredient9 ?? '').isNotEmpty) {
      result.add(Text('${state.selectedDetail?.strMeasure9} ${state.selectedDetail?.strIngredient9}', style: const TextStyle(fontSize: 16)));
    }
    if ((state.selectedDetail?.strIngredient10 ?? '').isNotEmpty) {
      result.add(Text('${state.selectedDetail?.strMeasure10} ${state.selectedDetail?.strIngredient10}', style: const TextStyle(fontSize: 16)));
    }
    if ((state.selectedDetail?.strIngredient11 ?? '').isNotEmpty) {
      result.add(Text('${state.selectedDetail?.strMeasure11} ${state.selectedDetail?.strIngredient11}', style: const TextStyle(fontSize: 16)));
    }
    if ((state.selectedDetail?.strIngredient12 ?? '').isNotEmpty) {
      result.add(Text('${state.selectedDetail?.strMeasure12} ${state.selectedDetail?.strIngredient12}', style: const TextStyle(fontSize: 16)));
    }
    if ((state.selectedDetail?.strIngredient13 ?? '').isNotEmpty) {
      result.add(Text('${state.selectedDetail?.strMeasure13} ${state.selectedDetail?.strIngredient13}', style: const TextStyle(fontSize: 16)));
    }
    if ((state.selectedDetail?.strIngredient14 ?? '').isNotEmpty) {
      result.add(Text('${state.selectedDetail?.strMeasure14} ${state.selectedDetail?.strIngredient14}', style: const TextStyle(fontSize: 16)));
    }
    if ((state.selectedDetail?.strIngredient15 ?? '').isNotEmpty) {
      result.add(Text('${state.selectedDetail?.strMeasure15} ${state.selectedDetail?.strIngredient15}', style: const TextStyle(fontSize: 16)));
    }
    if ((state.selectedDetail?.strIngredient16 ?? '').isNotEmpty) {
      result.add(Text('${state.selectedDetail?.strMeasure16} ${state.selectedDetail?.strIngredient16}', style: const TextStyle(fontSize: 16)));
    }
    if ((state.selectedDetail?.strIngredient17 ?? '').isNotEmpty) {
      result.add(Text('${state.selectedDetail?.strMeasure17} ${state.selectedDetail?.strIngredient17}', style: const TextStyle(fontSize: 16)));
    }
    if ((state.selectedDetail?.strIngredient18 ?? '').isNotEmpty) {
      result.add(Text('${state.selectedDetail?.strMeasure18} ${state.selectedDetail?.strIngredient18}', style: const TextStyle(fontSize: 16)));
    }
    if ((state.selectedDetail?.strIngredient19 ?? '').isNotEmpty) {
      result.add(Text('${state.selectedDetail?.strMeasure19} ${state.selectedDetail?.strIngredient19}', style: const TextStyle(fontSize: 16)));
    }
    if ((state.selectedDetail?.strIngredient20 ?? '').isNotEmpty) {
      result.add(Text('${state.selectedDetail?.strMeasure20} ${state.selectedDetail?.strIngredient20}', style: const TextStyle(fontSize: 16)));
    }

    result.add(Text('Instruction: ${state.selectedDetail?.strInstructions}', style: const TextStyle(fontSize: 16)).paddingSymmetric(vertical: 8));
    result.add(TextButton(
        onPressed: (){},
        child: Container(
          width: context.width,
          height: pixelToDp(context, 120),
          decoration: BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.circular(100)),
          child: const Center(child: Text('Tambah ke Favorit', style: TextStyle(fontSize: 14),)),
        )));
    return result;
  }
}