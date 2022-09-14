// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:meal_project/application/meal_bloc.dart';
import 'package:meal_project/domain/i_meal_repository.dart';
import 'package:meal_project/domain/i_meal_service.dart';
import 'package:meal_project/infrastructure/local_db/database.dart';
import 'package:meal_project/infrastructure/logger_interceptor.dart';
import 'package:meal_project/infrastructure/meal_repository.dart';
import 'package:meal_project/infrastructure/meal_service.dart';
import 'package:meal_project/presentation/meal_detail_page.dart';
import 'package:meal_project/presentation/meal_page.dart';
import 'package:meal_project/presentation/home_page.dart';
import 'package:meal_project/simple_bloc_delegate.dart';

class AppModule extends Module {
  static const HOME = '/';
  static const MEAL ='/categories/:category';
  static const MEAL_DETAIL ='/meal/:id';

  @override
  List<Bind> get binds => [
    Bind.lazySingleton<SimpleBlocObserver>((i) => SimpleBlocObserver(Logger(filter: DevelopmentFilter(), printer: PrettyPrinter(), output: ConsoleOutput(), level: Level.debug))),
    Bind.lazySingleton<IMealRepository>((i) => MealRepository(service: Modular.get<IMealService>(),db: Database())),
    Bind.lazySingleton<MealBloc>((i) => MealBloc(Modular.get<IMealRepository>())),
    Bind.lazySingleton<IMealService>((i) => MealService(Modular.get<Dio>(), Modular.get<SimpleBlocObserver>(), Modular.get<Connectivity>())),
    Bind.lazySingleton<Dio>((i) {
      Dio dio = Dio();
      BaseOptions options = BaseOptions(
        connectTimeout: 30000,
        receiveTimeout: 20000,
        sendTimeout: 10000,
        baseUrl: 'https://www.themealdb.com/api/json/v1/1/',
      );
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) {
          return true;
        };
        return client;
      };

      dio.options = options;

      dio.interceptors.add(LoggerInterceptor(requestBody: true, request: true, requestHeader: true, responseBody: true, responseHeader: true));
      return dio;
    }),
    Bind.lazySingleton<Connectivity>((i) => Connectivity())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(HOME, child: (context, args) =>  BlocProvider<MealBloc>(
  create: (context) => (Modular.get<MealBloc>())..add(const MealEvent.start()),
  child: const HomePage(),
), transition: TransitionType.fadeIn),
    ChildRoute(MEAL, child: (context, args) => DetailPage(category: args.params['category']), transition:TransitionType.fadeIn),
    ChildRoute(MEAL_DETAIL, child: (context, args) => MealDetailPage(category: args.params['id']), transition:TransitionType.fadeIn)
  ];
}