// ignore_for_file: file_names

import 'package:flutter_application_test/src/base/ApiService/AppError.dart';
import 'package:flutter_application_test/src/base/Constants/ErrorMessage.dart';
import 'package:flutter_application_test/src/features/data/Repositories/Auth/SignInRepository/SignInBodyParameters.dart';
import 'package:flutter_application_test/src/features/data/Repositories/Auth/SignInRepository/SignInRepository.dart';
import 'package:flutter_application_test/src/features/domain/Entities/Auth/SignInEntity/SignInEntity.dart';
import 'package:flutter_application_test/src/features/data/Interfaces/Interfaces.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';

import 'SignInUseCaseBodyParameters.dart';

abstract class SignInUseCase {
  Future<Result<SignInEntity, Failure>> execute(
      {required SignInUseCaseParameters params});
}

class DefaultSignInUseCase extends SignInUseCase {
  //Dependencias
  final SignInRepositorty _signInRepositorty;

  DefaultSignInUseCase({SignInRepositorty? signInRepositorty})
      : _signInRepositorty = signInRepositorty ?? DefaultSignInRepository();

  @override
  Future<Result<SignInEntity, Failure>> execute(
      {required SignInUseCaseParameters params}) {
    return _signInRepositorty
        .signIn(
            params: SignInBodyParameters(
                email: params.email, password: params.password))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(
                message: AppFailureMessages.unExpectedErrorMessage));
          }
          var entity = SignInEntity.fromMap(result.value!.toMap());

          return Result.success(entity);

        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
