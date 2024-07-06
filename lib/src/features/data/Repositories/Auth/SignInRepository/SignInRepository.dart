// ignore_for_file: file_names

import 'package:flutter_application_test/src/base/ApiService/AppError.dart';
import 'package:flutter_application_test/src/features/data/Repositories/Auth/SignInRepository/SignInBodyParameters.dart';
import 'package:flutter_application_test/src/features/data/Interfaces/Interfaces.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/AuthFirebaseService/Decodables/SignInDecodable.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/AuthFirebaseService/Interfaces/AuthFirebaseInterface.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/AuthFirebaseService/Services/SignInAuthService.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';

class DefaultSignInRepository extends SignInRepositorty {
  final SignInService _signInService;

  DefaultSignInRepository({SignInService? signInService})
      : _signInService = signInService ?? DefaultSignInService();

  @override
  Future<Result<SignInDecodable, Failure>> signIn(
      {required SignInBodyParameters params}) async {
    try {
      final result =
          await _signInService.signIn(bodyParameters: params.toMap());
      SignInDecodable decodable = SignInDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(
          Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
