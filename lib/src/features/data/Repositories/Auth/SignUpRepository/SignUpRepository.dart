// ignore_for_file: file_names

import 'package:flutter_application_test/src/base/ApiService/AppError.dart';
import 'package:flutter_application_test/src/features/data/Repositories/Auth/SignUpRepository/SignUpBodyParameters.dart';
import 'package:flutter_application_test/src/features/data/Interfaces/Interfaces.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/AuthFirebaseService/Decodables/SignUpDecodable.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/AuthFirebaseService/Interfaces/AuthFirebaseInterface.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/AuthFirebaseService/Services/SignUpAuthService.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';

class DefaultSignUpRepository extends SignUpRepository {
  // * Dependencies
  final SignUpService _signUpService;

  DefaultSignUpRepository({SignUpService? signUpService})
      : _signUpService = signUpService ?? DefaultSignUpService();

  @override
  Future<Result<SignUpDecodable, Failure>> signUp(
      {required SignUpBodyParameters params}) async {
    try {
      final result =
          await _signUpService.signUp(bodyParameters: params.toMap());
      SignUpDecodable decodable = SignUpDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(
          Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
