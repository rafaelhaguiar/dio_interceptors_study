import 'package:dio/dio.dart';
import 'package:dio_interceptors_study/app/core/client/client_exceptions.dart';

///We can oveeride the response and the request method to.
class ClientInterceptors extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.response?.statusCode) {
      case 401:
        throw ClientNotAuthorizedException();
      case 408:
        throw ClientTimeOutException();
      case 500:
        throw ClientInternalServerError();
      default:
        throw ClientGenericException();
    }
  }
}
