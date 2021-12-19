import 'package:dio/dio.dart';
import 'package:dio_interceptors_study/app/core/client/client.dart';

class MockApiDatasource {
  Client client;
  MockApiDatasource({
    required this.client,
  });
  Future<void> getResponse({required code}) async {
    try {
      await client.get(code.toString());
    } on DioError catch (e) {
      throw e.error;
    }
  }
}
