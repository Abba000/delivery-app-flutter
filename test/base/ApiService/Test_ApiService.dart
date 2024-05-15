// ignore_for_file: file_names

import 'package:flutter_application_test/src/base/ApiService/ApiService.dart';
import 'package:flutter_test/flutter_test.dart';

import 'Mocks/TestApiMocks.dart';

abstract class _Constants {
  static Map<String,String> defaultHeaders = {'Content-type': 'application/json; charset=UTF-8' };
  static String postEndpoint = "https://jsonplaceholder.typicode.com/posts";
  static String getEndpoint = "https://jsonplaceholder.typicode.com/posts/1";
  static String putEndpoint = "https://jsonplaceholder.typicode.com/posts/1";
}

void main() {
  final Apiservice _testApiService = DefaultApiService();

  //post
  group('Test correct conection of Api Service', () {

    test('Test correct post connection to jsonPlaceholder', () async {
      final bodyParams =
          CorrectPostBodyParams(title: 'foo', body: 'bar', userId: 1);
      final result = await _testApiService.getDataFromPostRequest(
          bodyParameters: bodyParams.toJson(), url: _Constants.postEndpoint, headers: _Constants.defaultHeaders);

      expect(result, Map.from(result));
    });

    //get
    test('Test correct get connection to json placeholder', () async {
      final result = await _testApiService.getDataFromGetRequest(url: _Constants.getEndpoint);

      expect(result, Map.from(result));
    });

    //put
    test('Test correct put connection to jsonplaceholder', () async {
      final params = CorrectPutBodyParams(id:1, title: "foo", body: "bar", userId: 1);
      final result = await _testApiService.getDataFromPutRequest(bodyParameters: params.toMap(), url: _Constants.putEndpoint, headers: _Constants.defaultHeaders);

      expect(result, Map.from(result));
    });
  });
}
