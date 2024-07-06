// ignore_for_file: file_names, override_on_non_overriding_member

import '../../../../base/ApiService/AppError.dart';
import '../Interfaces/AuthFirebaseInterface.dart';

class DefaultSignInService extends SignInService {
  @override
  Future<Map<String, dynamic>> signIn(
      {required Map<String, dynamic> bodyParameters}) async {
    return apiService.getDataFromPostRequest(
        bodyParameters: bodyParameters, url: endpoint);
  }

  @override
  Future<String> getIdToken(
      {required Map<String, dynamic> bodyParameters}) async {
    try {
      final userData = await signIn(bodyParameters: bodyParameters);
      return userData['idToken'] as String;
    } on Failure catch (f) {
      return Future.error(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
