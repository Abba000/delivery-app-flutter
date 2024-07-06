// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_test/src/services/GoogleSignInService/Entities/GoogleUserEntity.dart';

class GoogleSignInMapper {
  static GoogleSignInUserEntity mapUserCredential(
      UserCredential credential, String? idToken) {
    return GoogleSignInUserEntity(credential.user, idToken);
  }
}
