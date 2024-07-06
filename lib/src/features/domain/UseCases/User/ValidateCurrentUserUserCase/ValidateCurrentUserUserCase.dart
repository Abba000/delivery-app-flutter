// ignore_for_file: file_names

import 'package:flutter_application_test/src/base/ApiService/AppError.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/Auth/UserAuthData/GetUserDataUseCase.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/Auth/UserAuthData/GetUserDataUseCaseParameters.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';

abstract class ValidateCurrentUserCase {
  Future<bool> execute({required String idToken});
}

class DefaultValidateCurrentUserCase extends ValidateCurrentUserCase {
  // * Dependencies
  final GetUserAuthDataUseCase _getUserAuthDataUseCase;

  DefaultValidateCurrentUserCase(
      {GetUserAuthDataUseCase? getUserAuthDataUseCase})
      : _getUserAuthDataUseCase =
            getUserAuthDataUseCase ?? DefaultGetUserAuthDataUseCase();

  @override
  Future<bool> execute({required String idToken}) async {
    try {
      return _getUserAuthDataUseCase
          .execute(params: GetUserDataUseCaseParameters(idToken: idToken))
          .then((result) {
        switch (result.status) {
          case ResultStatus.success:
            return true;
          case ResultStatus.error:
            return false;
        }
      });
    } on Failure {
      return false;
    }
  }
}
