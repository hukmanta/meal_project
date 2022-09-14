import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:meal_project/domain/exceptions/exceptions.dart';
import 'package:meal_project/domain/i_meal_service.dart';
import 'package:meal_project/simple_bloc_delegate.dart';


class MealService extends IMealService{
  final Dio _dio;
  final SimpleBlocObserver _observer;
  final Connectivity _connectivity;

  MealService(this._dio, this._observer, this._connectivity);

  @override
  Future getHttp({required String path, String? parameter, Map<String, dynamic>? queryParameter, Map<String, dynamic>? header, bool useAuth = true}) async{
    var connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      try {
        _observer.logger.i(path);
        _observer.logger.i(parameter);

        Response response = await _dio.get(
          '$path${parameter ?? ""}',
          queryParameters: queryParameter,
        );
        return response.data;
      } on DioError catch (e) {
        switch (e.type) {
          case DioErrorType.connectTimeout:
            throw TimeOutException();
          case DioErrorType.other:
            throw NetworkException(e.response!.data);
          default:
            throw ServerException(error: e);
        }
      }
    } else {
      throw NoInternetException();
    }

  }

}