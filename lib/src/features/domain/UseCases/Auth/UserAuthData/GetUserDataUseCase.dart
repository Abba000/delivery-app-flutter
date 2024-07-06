// ignore_for_file: file_names

import 'package:flutter_application_test/src/base/ApiService/AppError.dart';
import 'package:flutter_application_test/src/base/Constants/ErrorMessage.dart';
import 'package:flutter_application_test/src/features/data/Repositories/Auth/UserData/GetUserDataRepository.dart';
import 'package:flutter_application_test/src/features/data/Repositories/Auth/UserData/GetUserDataRepositoryParameters.dart';
import 'package:flutter_application_test/src/features/domain/Entities/Auth/UserAuthData/UserAuthDataEntity.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/Auth/UserAuthData/GetUserDataUseCaseParameters.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';

abstract class GetUserAuthDataUseCase {
  Future<Result<UserAuthDataEntity, Failure>> execute(
      {required GetUserDataUseCaseParameters params});
}

class DefaultGetUserAuthDataUseCase extends GetUserAuthDataUseCase {
  // * Dependencies
  final GetAuthUserDataRepository _getAuthUserDataRepository;

  DefaultGetUserAuthDataUseCase(
      {GetAuthUserDataRepository? getAuthUserDataRepository})
      : _getAuthUserDataRepository =
            getAuthUserDataRepository ?? DefaultGetAuthUserDataRepository();

  @override
  Future<Result<UserAuthDataEntity, Failure>> execute(
      {required GetUserDataUseCaseParameters params}) {
    return _getAuthUserDataRepository
        .getUserData(params: GetUserDataBodyParameters(idToken: params.idToken))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(
                message: AppFailureMessages.unExpectedErrorMessage));
          }
          return Result.success(
              UserAuthDataEntity.fromMap(result.value!.toMap()));
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
