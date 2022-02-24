/// class untuk mendifinisikan error API yang disebabkan oleh kesalahan jaringan

class NetworkException implements Exception {
  dynamic baseEntity;

  NetworkException(this.baseEntity);
}