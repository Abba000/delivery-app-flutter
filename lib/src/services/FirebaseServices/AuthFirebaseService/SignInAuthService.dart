// ignore_for_file: file_names

import 'package:flutter_application_test/src/services/FirebaseServices/AuthFirebaseService/Interfaces.dart';

class DefaultSignInService extends SignInService {
  @override
  Future<Map<String, dynamic>> signIn(
      {required Map<String, dynamic> bodyParameters}) {
    return apiService
        .getDataFromPostRequest(bodyParameters: bodyParameters, url: endpoint)
        .then((result) {
      return result;
    });
  }
}
