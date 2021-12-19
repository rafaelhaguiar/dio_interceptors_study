import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:dio_interceptors_study/app/core/client/client_interceptors.dart';

class Client extends DioForNative {
  Client()
      : super(BaseOptions(
            baseUrl: "https://mock.codes/", headers: {"token": "thisToken"})) {
    ///We can create multiple interceptors and add in client.
    super.interceptors.add(ClientInterceptors());
  }
}
