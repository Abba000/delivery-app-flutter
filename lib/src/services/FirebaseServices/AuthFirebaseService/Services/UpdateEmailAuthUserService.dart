// ignore_for_file: file_names

import 'package:flutter_application_test/src/services/FirebaseServices/AuthFirebaseService/Services/SignInAuthService.dart';

import '../../../../base/ApiService/AppError.dart';
import '../Interfaces/AuthFirebaseInterface.dart';

class DefaultUpdateEmailUserService extends UpdateEmailUserService {
  // * Dependencies
  final SignInService _signInService;

  DefaultUpdateEmailUserService({SignInService? signInService})
      : _signInService = signInService ?? DefaultSignInService();

  @override
  Future<Map<String, dynamic>> updateEmail(
      {required String oldEmail,
      required String newEmail,
      required String password}) async {
    try {
      final Map<String, dynamic> signInBodyParameters = {
        'email': oldEmail,
        'password': password,
        'returnSecureToken': true,
      };

      final idToken =
          await _signInService.getIdToken(bodyParameters: signInBodyParameters);

      final Map<String, dynamic> bodyParameters = {
        'email': newEmail,
        'idToken': idToken,
        'returnSecureToken': true,
      };

      return apiService.getDataFromPostRequest(
          bodyParameters: bodyParameters, url: endpoint);
    } on Failure catch (f) {
      return Future.error(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
