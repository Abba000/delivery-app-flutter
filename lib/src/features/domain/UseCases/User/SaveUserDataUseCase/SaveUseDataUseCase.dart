// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'package:flutter_application_test/src/base/ApiService/AppError.dart';
import 'package:flutter_application_test/src/features/data/Repositories/User/SaveUserDataRepository.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/User/SaveUserDataUseCase/SaveUseDataUseCaseParameters.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';

import '../../../../../base/Constants/ErrorMessage.dart';
import '../../../../data/Repositories/User/UserBodyParameters.dart';
import '../../../Entities/User/UserEntity.dart';

abstract class SaveUserDataUseCase {
  Future<Result<UserEntity, Failure>> execute(
      {required SaveUserDataUseCaseParameters params});
}

class DefaultSaveUserDataUseCase extends SaveUserDataUseCase {
  // * Dependencies
  final SaveUserDataRepository _saveUserDataRepository;

  DefaultSaveUserDataUseCase({SaveUserDataRepository? saveUserDataRepository})
      : _saveUserDataRepository =
            saveUserDataRepository ?? DefaultSaveUserDataRepository();

  @override
  Future<Result<UserEntity, Failure>> execute(
      {required SaveUserDataUseCaseParameters params}) {
    UserBodyParameters _parameters = UserBodyParameters(
        localId: params.localId,
        role: params.role?.toShortString(),
        username: params.username,
        email: params.email,
        phone: params.phone,
        dateOfBirth: params.dateOfBirth,
        startDate: params.startDate,
        photo: params.photo,
        shippingAddress: params.shippingAddress,
        billingAddress: params.billingAddress,
        idToken: params.idToken,
        provider: params.provider);

    return _saveUserDataRepository
        .saveUserData(params: _parameters)
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(
                message: AppFailureMessages.unExpectedErrorMessage));
          }
          return Result.success(UserEntity.fromMap(result.value!.toMap()));
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
