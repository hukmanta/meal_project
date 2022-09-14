// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

class SimpleBlocObserver extends BlocObserver {
  SimpleBlocObserver(this.logger);
  final Logger logger;

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);

    logger.d('$event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.d('$transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.e('Error', error, stackTrace);
  }
}