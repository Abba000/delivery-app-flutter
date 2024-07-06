// ignore_for_file: file_names

import 'package:flutter_application_test/src/services/GoogleSignInService/Entities/GoogleUserEntity.dart';

abstract class GoogleSignInService {
  Future<GoogleSignInUserEntity> signInWithGoogle();
  Future<bool> isUserInDatabase({required String uid});
}
