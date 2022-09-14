import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meal_project/app_module.dart';
import 'package:meal_project/extension.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:iconsax/iconsax.dart';
import 'package:meal_project/application/meal_bloc.dart';

import 'my_image.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, String? category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MealBloc, MealState>(
      bloc: Modular.get<MealBloc>(),
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Modular.get<MealBloc>().add(MealEvent.mealDetail(state.mealDetail[index]));
                      Modular.to.pushNamed(AppModule.MEAL_DETAIL);
                    },
                    child: Card(
                      color: Colors.white70,
                      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        SizedBox(
                                width: context.widthTransformer(dividedBy: 3),
                                height: pixelToDp(context, 200),
                                child: MyImage(path: state.mealDetail[index].strMealThumb))
                            .paddingAll(defaultMargin(context)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Shimmer.fromColors(
                                  baseColor: basicShimmerColor,
                                  highlightColor: highlightShimmerColor,
                                  enabled: state.isLoading,
                                  child: Text(
                                    state.mealDetail[index].strMeal,
                                    style: const TextStyle(color: Colors.black),
                                  )),
                            ],
                          ).paddingAll(defaultMargin(context)),
                        )
                      ]),
                    ).marginAll(defaultMargin(context)),
                  );
                },
                itemCount: state.mealDetail.length),
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
}