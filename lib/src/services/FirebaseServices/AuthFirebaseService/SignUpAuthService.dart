// ignore_for_file: file_names

import 'package:flutter_application_test/src/services/FirebaseServices/AuthFirebaseService/Interfaces.dart';

class DefaultSignUpService extends SignUpService {
  @override
  Future<Map<String, dynamic>> signUp(
      {required Map<String, dynamic> bodyParameters}) async {
    return apiService
        .getDataFromPostRequest(bodyParameters: bodyParameters, url: endpoint)
        .then((result) {
      return result;
    });
  }
}
