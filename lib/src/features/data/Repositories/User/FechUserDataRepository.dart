// ignore_for_file: file_names

import 'package:flutter_application_test/src/base/ApiService/AppError.dart';
import 'package:flutter_application_test/src/features/data/Decodables/User/UserDecodable.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/RealtimeDatabaseService/Interfaces/Interfaces.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/RealtimeDatabaseService/Services/RealtimeDatabaseService.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';

abstract class FetchUserDataRepository {
  Future<Result<UserDecodable, Failure>> fetchUserData(
      {required String localId});
}

class DefaultFetchUserDataRepository extends FetchUserDataRepository {
  final String _path = "users/";

  // * Dependencies
  final RealtimeDataBaseService _realtimeDataBaseService;

  DefaultFetchUserDataRepository(
      {RealtimeDataBaseService? realtimeDataBaseService})
      : _realtimeDataBaseService =
            realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<Result<UserDecodable, Failure>> fetchUserData(
      {required String localId}) async {
    var fullpath = _path + localId;
    try {
      final result = await _realtimeDataBaseService.getData(path: fullpath);
      return Result.success(UserDecodable.fromMap(result));
    } on Failure catch (f) {
      return Result.failure(f);
    }
  }
}
