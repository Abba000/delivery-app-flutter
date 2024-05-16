// ignore_for_file: file_names

import 'package:flutter_application_test/src/services/FirebaseServices/RealtimeDatabaseService/Interfaces/Interfaces.dart';

class DefaultRealtimeDatabaseService extends RealtimeDataBaseService {
  @override
  Future<Map<String, dynamic>> getData({required String path}) {
    var endpoint =
        RealtimeDataBaseService.baseUrl + path + RealtimeDataBaseService.endUrl;

    return apiService.getDataFromGetRequest(url: endpoint).then((result) {
      return result;
    });
  }

  @override
  Future<Map<String, dynamic>> putData(
      {required Map<String, dynamic> bodyParameters, required String path}) {
    var endpoint =
        RealtimeDataBaseService.baseUrl + path + RealtimeDataBaseService.endUrl;

    return apiService
        .getDataFromPutRequest(bodyParameters: bodyParameters, url: endpoint)
        .then((result) {
      return result;
    });
  }
}
