// ignore_for_file: file_names

import 'package:flutter_application_test/src/base/ApiService/AppError.dart';
import 'package:flutter_application_test/src/base/Constants/ErrorMessage.dart';
import 'package:flutter_application_test/src/features/data/Decodables/User/UserDecodable.dart';
import 'package:flutter_application_test/src/features/data/Repositories/User/UserBodyParameters.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/RealtimeDatabaseService/Interfaces/Interfaces.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/RealtimeDatabaseService/Services/RealtimeDatabaseService.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';

abstract class _Paths {
  static String userCollection = "users/";
}

abstract class SaveUserDataRepository {
  Future<Result<UserDecodable, Failure>> saveUserData(
      {required UserBodyParameters params});
}

class DefaultSaveUserDataRepository extends SaveUserDataRepository {
  // * Dependencies
  final RealtimeDataBaseService _realtimeDataBaseService;

  DefaultSaveUserDataRepository(
      {RealtimeDataBaseService? realtimeDataBaseService})
      : _realtimeDataBaseService =
            realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<Result<UserDecodable, Failure>> saveUserData(
      {required UserBodyParameters params}) async {
    if (params.localId == null) {
      return Result.failure(Failure.fromMessage(
          message: AppFailureMessages.unExpectedErrorMessage));
    }

    var path = _Paths.userCollection + params.localId!;

    try {
      final result = await _realtimeDataBaseService.putData(
          bodyParameters: params.toMap(), path: path);
      UserDecodable decodable = UserDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(f);
    }
  }
}
