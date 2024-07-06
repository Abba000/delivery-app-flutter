// ignore_for_file: file_names

import 'package:flutter_application_test/src/base/ApiService/AppError.dart';
import 'package:flutter_application_test/src/features/data/Decodables/Auth/UserAuthData/UserAuthDataDecodable.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/AuthFirebaseService/Interfaces/AuthFirebaseInterface.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/AuthFirebaseService/Services/GetUserAuthDataService.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';

import 'GetUserDataRepositoryParameters.dart';

abstract class GetAuthUserDataRepository {
  Future<Result<UserAuthDataDecodable, Failure>> getUserData(
      {required GetUserDataBodyParameters params});
}

class DefaultGetAuthUserDataRepository extends GetAuthUserDataRepository {
  // * Dependencies
  final GetUserDataService _getUserDataService;

  DefaultGetAuthUserDataRepository({GetUserDataService? userDataService})
      : _getUserDataService = userDataService ?? DefaultGetUserDataService();

  @override
  Future<Result<UserAuthDataDecodable, Failure>> getUserData(
      {required GetUserDataBodyParameters params}) async {
    try {
      final result =
          await _getUserDataService.getUserData(bodyParameters: params.toMap());
      return Result.success(UserAuthDataDecodable.fromMap(result));
    } on Failure catch (f) {
      return Result.failure(
          Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
