import 'dart:core';

import 'package:dio/dio.dart';

/// class untuk mendifinisikan error API yang disebabkan oleh kesalahan dari server
class ServerException implements Exception {
  ServerException({this.e, this.error});

  final Exception? e;
  final DioError? error;

  get getError => error;

  get getException => e;
}
