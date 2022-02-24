import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:template_project/flavor_config.dart';
import 'package:template_project/injection.dart';

void main() async{
    await Hive.initFlutter();
    FlavorConfig(flavor: Flavor.development, values: FlavorValues(apiUrl: "", apiKey: ""));
    configureInjection(Environment.dev);
    BlocOverrides.runZoned(
          () {
        runApp(
          GetMaterialApp(
            localizationsDelegates: [
              I10n.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: I10n.delegate.supportedLocales,
            initialRoute: Routers.main,
            getPages: Routers().routers,
            debugShowCheckedModeBanner: false,
            locale: Locale('id', 'ID'),
            fallbackLocale: Locale('id', 'ID'),
          ),
        );
        I10n.load(Locale('id', 'ID'));
      },
      blocObserver: getIt<SimpleBlocObserver>(),
    );
  }
