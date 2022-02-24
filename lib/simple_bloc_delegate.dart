import 'package:bloc/bloc.dart';
//import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
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
    // if (!kDebugMode) {
    //  FirebaseCrashlytics.instance.recordError(error, stacktrace);
    // }
  }

  // @override
  // void onChange(BlocBase bloc, Change change) {
  //   super.onChange(bloc, change);
  //    logger.d('$bloc, $change');
  // }
}
