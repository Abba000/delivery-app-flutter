// ignore_for_file: file_names

import 'package:flutter_application_test/src/base/ApiService/ApiService.dart';

abstract class BaseRealTimeDataBaseFirebase {
  ApiService apiService = DefaultApiService();
}

abstract class RealtimeDataBaseService extends BaseRealTimeDataBaseFirebase {
  static String baseUrl =
      "https://delivery-app-flutter-udemy-default-rtdb.firebaseio.com/";
  static String adminToken = "AIzaSyDbWApYAtSOdT5n2TRvmWs6tcR5Q4Ed9IY";
  static String endUrl = ".json";

  Future<Map<String, dynamic>> putData(
      {required Map<String, dynamic> bodyParameters, required String path});
  Future<Map<String, dynamic>> getData({required String path});
}
