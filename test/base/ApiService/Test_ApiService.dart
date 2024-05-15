// ignore_for_file: file_names

import 'package:flutter_application_test/src/base/ApiService/ApiService.dart';
import 'package:flutter_test/flutter_test.dart';

import 'Mocks/TestApiMocks.dart';

abstract class _Constants {
  static String postEndpoint = "https://jsonplaceholder.typicode.com/posts";
}

void main() {
  final Apiservice _testApiService = DefaultApiService();

  group('Test correct conection of Api Service', () {
    test('Test correct post connection to jsonPlaceholder', () async {
      final bodyParams =
          CorrectPostBodyParams(title: 'foo', body: 'bar', userId: 1);
      final result = await _testApiService.getDataFromPostRequest(
          bodyParameters: bodyParams.toJson(), url: _Constants.postEndpoint);

      expect(result, Map.from(result));
    });
  });
}
