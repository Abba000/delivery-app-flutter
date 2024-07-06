// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_test/src/base/ApiService/AppError.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/RealtimeDatabaseService/Interfaces/Interfaces.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/RealtimeDatabaseService/Services/RealtimeDatabaseService.dart';
import 'package:flutter_application_test/src/services/GoogleSignInService/Entities/GoogleUserEntity.dart';
import 'package:flutter_application_test/src/services/GoogleSignInService/Interfaces/Interface.dart';
import 'package:flutter_application_test/src/services/GoogleSignInService/Mappers/GoogleSignInMappers.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DefaultGoogleSignInService extends GoogleSignInService {
  final RealtimeDataBaseService _realtimeDataBaseService;
  final String _path = "users/";

  // Dependencies
  DefaultGoogleSignInService({RealtimeDataBaseService? realtimeDataBaseService})
      : _realtimeDataBaseService =
            realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<GoogleSignInUserEntity> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return GoogleSignInMapper.mapUserCredential(
        userCredential, googleAuth?.idToken);
  }

  @override
  Future<bool> isUserInDatabase({required String uid}) async {
    final fullpath = _path + uid;
    try {
      final result = await _realtimeDataBaseService.getData(path: fullpath);
      return result.isNotEmpty;
    } on Failure {
      return false;
    }
  }
}
