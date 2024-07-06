// ignore_for_file: file_names

import '../Interfaces/AuthFirebaseInterface.dart';

class DefaultGetUserDataService extends GetUserDataService {
  @override
  Future<Map<String, dynamic>> getUserData(
      {required Map<String, dynamic> bodyParameters}) {
    return apiService.getDataFromPostRequest(
        bodyParameters: bodyParameters, url: endpoint);
  }
}
