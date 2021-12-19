import 'dart:developer';

import 'package:dio_interceptors_study/app/core/client/client.dart';
import 'package:dio_interceptors_study/app/core/client/client_exceptions.dart';
import 'package:dio_interceptors_study/app/home/datasources/mock_api_datasource.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            child: Card(
              child: TextButton(
                  onPressed: () async => await sendRequest(code: 200),
                  child: const Text("Success")),
            ),
          ),
          SizedBox(
            width: 300,
            child: Card(
              child: TextButton(
                  onPressed: () async => await sendRequest(code: 401),
                  child: const Text("ClientNotAuthorizedException")),
            ),
          ),
          SizedBox(
            width: 300,
            child: Card(
              child: TextButton(
                  onPressed: () async => await sendRequest(code: 408),
                  child: const Text("ClientTimeOutException")),
            ),
          ),
          SizedBox(
            width: 300,
            child: Card(
              child: TextButton(
                  onPressed: () async => await sendRequest(code: 500),
                  child: const Text("ClientInternalServerError")),
            ),
          ),
          SizedBox(
            width: 300,
            child: Card(
              child: TextButton(
                  onPressed: () async => await sendRequest(code: 505),
                  child: const Text("ClientGenericException")),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> sendRequest({required int code}) async {
    try {
      MockApiDatasource api = MockApiDatasource(client: Client());

      await api.getResponse(code: code);
      log("Success");
    } on ClientNotAuthorizedException {
      log("Client Not Authorized");
    } on ClientTimeOutException {
      log("TimeOut");
    } on ClientInternalServerError {
      log("Server Error");
    } on ClientGenericException {
      log("Generic error");
    } catch (e) {
      log("Error not handler: ${e.toString()}");
    }
  }
}
