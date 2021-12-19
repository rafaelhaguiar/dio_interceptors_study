import 'package:dio_interceptors_study/app/core/client/client.dart';
import 'package:dio_interceptors_study/app/core/client/client_exceptions.dart';
import 'package:dio_interceptors_study/app/home/datasources/mock_api_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Client client;
  late MockApiDatasource datasource;

  setUp(() {
    client = Client();
    datasource = MockApiDatasource(client: client);
  });

  test(
      "[DIO ERROR INTERCEPTOR TEST] - should return ClientNotAuthorizedException",
      () {
    final result = datasource.getResponse(code: 401);
    expectLater(result, throwsA(isA<ClientNotAuthorizedException>()));
  });

  test("[DIO ERROR INTERCEPTOR TEST] - should return ClientTimeOutException",
      () {
    final result = datasource.getResponse(code: 408);
    expectLater(result, throwsA(isA<ClientTimeOutException>()));
  });

  test("[DIO ERROR INTERCEPTOR TEST] - should return ClientInternalServerError",
      () {
    final result = datasource.getResponse(code: 500);
    expectLater(result, throwsA(isA<ClientInternalServerError>()));
  });

  test("[DIO ERROR INTERCEPTOR TEST] - should return ClientGenericException",
      () {
    final result = datasource.getResponse(code: 510);
    expectLater(result, throwsA(isA<ClientGenericException>()));
  });
}
