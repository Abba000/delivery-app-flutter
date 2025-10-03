// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'package:flutter_application_test/src/base/ApiService/AppError.dart';
import 'package:flutter_application_test/src/features/data/Repositories/Auth/SignUpRepository/SignUpRepository.dart';
import 'package:flutter_application_test/src/features/data/Repositories/Auth/SignUpRepository/SignUpBodyParameters.dart';
import 'package:flutter_application_test/src/features/domain/Entities/Auth/SignUpEntity/SignUpEntity.dart';
import 'package:flutter_application_test/src/features/data/Interfaces/Interfaces.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/Auth/SignUpUseCase/SignUpUseCaseParameters.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';

import '../../../../../base/Constants/ErrorMessage.dart';
import '../../../../../utils/Helpers/Date/DateHelpers.dart';
import '../../../../../utils/Helpers/DefaultImages/DefaultUserPhotoHelper.dart';
import '../../../Entities/User/UserEntity.dart';
import '../../User/SaveUserDataUseCase/SaveUseDataUseCase.dart';
import '../../User/SaveUserDataUseCase/SaveUseDataUseCaseParameters.dart';

abstract class SignUpUseCase {
  Future<Result<SignUpEntity, Failure>> execute(
      {required SignUpUseCaseParameters params});
}

class DefaultSignUpUseCase extends SignUpUseCase {
  // * Dependencies
  final SignUpRepository _signUpRepository;
  final SaveUserDataUseCase _saveUserDataUseCase;

  DefaultSignUpUseCase(
      {SignUpRepository? signUpRepository,
      SaveUserDataUseCase? saveUserDataUseCase})
      : _signUpRepository = signUpRepository ?? DefaultSignUpRepository(),
        _saveUserDataUseCase =
            saveUserDataUseCase ?? DefaultSaveUserDataUseCase();

  @override
  Future<Result<SignUpEntity, Failure>> execute(
      {required SignUpUseCaseParameters params}) {
    return _signUpRepository
        .signUp(
            params: SignUpBodyParameters(
                email: params.email, password: params.password))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          // Null Check
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(
                message: AppFailureMessages.unExpectedErrorMessage));
          }
          return saveUserDataInDataBase(
              params: params,
              entity: SignUpEntity.fromJson(result.value!.toMap()));
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}

extension on DefaultSignUpUseCase {
  Future<Result<SignUpEntity, Failure>> saveUserDataInDataBase(
      {required SignUpUseCaseParameters params, required SignUpEntity entity}) {
    SaveUserDataUseCaseParameters _params = SaveUserDataUseCaseParameters(
        localId: entity.localId,
        role: UserRole.user,
        username: params.username,
        email: entity.email,
        phone: params.phone,
        dateOfBirth: params.date,
        startDate: DateHelpers.getStartDate(),
        photo: DefaultUserPhotoHelper.defaultUserPhoto,
        shippingAddress: '',
        billingAddress: '',
        idToken: entity.idToken,
        provider: UserAuthProvider.emailAndPassword);

    return _saveUserDataUseCase.execute(params: _params).then((result) {
      switch (result.status) {
        case ResultStatus.success:
          return Result.success(entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
