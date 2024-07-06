// ignore_for_file: file_names

import 'package:flutter_application_test/src/base/ApiService/AppError.dart';
import 'package:flutter_application_test/src/features/data/Interfaces/Interfaces.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/AuthFirebaseService/Decodables/UpdatePasswordDecodable.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/AuthFirebaseService/Interfaces/AuthFirebaseInterface.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/AuthFirebaseService/Services/UpdatePasswordUserService.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';

class DefaultUpdatePasswordRepository extends UpdatePasswordRepository {
  //Dependencias

  final UpdatePasswordUserService _updatePasswordUserService;

  DefaultUpdatePasswordRepository(
      {UpdatePasswordUserService? updatePasswordUserService})
      : _updatePasswordUserService =
            updatePasswordUserService ?? DefaultUpdatePasswordUserService();

  @override
  Future<Result<UpdatePasswordDecodable, Failure>> updatePassword(
      {required String email}) async {
    try {
      final result =
          await _updatePasswordUserService.updatePassword(email: email);
      UpdatePasswordDecodable decodable =
          UpdatePasswordDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(
          Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
