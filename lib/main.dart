import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:meal_project/app_module.dart';
import 'package:meal_project/simple_bloc_delegate.dart';

void main() async {
  // ignore: deprecated_member_use
  BlocOverrides.runZoned(
        () {
      runApp(ModularApp(module: AppModule(), child: const AppWidget()));
    },
    blocObserver: SimpleBlocObserver(Logger(filter: DevelopmentFilter(), printer: PrettyPrinter(), output: ConsoleOutput(), level: Level.debug)),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'My Meal Apps',
        theme: ThemeData(primarySwatch: Colors.amber),
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate);
  }
}