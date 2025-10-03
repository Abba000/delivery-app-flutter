// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'package:flutter_application_test/src/base/ApiService/AppError.dart';
import 'package:flutter_application_test/src/base/Constants/LocalStorageKey.dart';
import 'package:flutter_application_test/src/features/domain/Entities/User/UserEntity.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/LocalStorage/SaveLocalStorageUseCase.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/User/SaveUserDataUseCase/SaveUseDataUseCase.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/User/SaveUserDataUseCase/SaveUseDataUseCaseParameters.dart';
import 'package:flutter_application_test/src/services/GoogleSignInService/Entities/GoogleUserEntity.dart';
import 'package:flutter_application_test/src/services/GoogleSignInService/Interfaces/Interface.dart';
import 'package:flutter_application_test/src/services/GoogleSignInService/Services/GoogleSignInService.dart';
import 'package:flutter_application_test/src/utils/Helpers/Date/DateHelpers.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';

abstract class GoogleSignInUseCase {
  Future<Result<UserEntity, Failure>> execute();
}

class DefaultGoogleSignInUseCase extends GoogleSignInUseCase {
  // Dependencies
  final GoogleSignInService _googleSignInService;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;
  final SaveUserDataUseCase _saveUserDataUseCase;

  DefaultGoogleSignInUseCase(
      {GoogleSignInService? googleSignInService,
      SaveLocalStorageUseCase? saveLocalStorageUseCase,
      SaveUserDataUseCase? saveUserDataUseCase})
      : _googleSignInService =
            googleSignInService ?? DefaultGoogleSignInService(),
        _saveLocalStorageUseCase =
            saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase(),
        _saveUserDataUseCase =
            saveUserDataUseCase ?? DefaultSaveUserDataUseCase();

  @override
  Future<Result<UserEntity, Failure>> execute() async {
    final user = await _googleSignInService.signInWithGoogle();
    _saveLocalStorageUseCase.execute(
        saveLocalParameteres: SaveLocalStorageParameters(
            key: LocalStorageKeys.idToken, value: user.uid ?? ""));

    final isUserInDatabase =
        await _googleSignInService.isUserInDatabase(uid: user.uid ?? "");
    if (isUserInDatabase) {
      return Result.success(mapUserEntity(user: user));
    } else {
      return _saveUserDataInDataBase(user: user);
    }
  }
}

extension on DefaultGoogleSignInUseCase {
  Future<Result<UserEntity, Failure>> _saveUserDataInDataBase(
      {required GoogleSignInUserEntity user}) {
    SaveUserDataUseCaseParameters _params = SaveUserDataUseCaseParameters(
        localId: user.uid,
        role: UserRole.user,
        username: user.displayName,
        email: user.email,
        phone: user.phoneNumber,
        dateOfBirth: "",
        startDate: DateHelpers.getStartDate(),
        photo: user.photoURL,
        shippingAddress: '',
        billingAddress: '',
        idToken: user.idToken,
        provider: UserAuthProvider.google);

    return _saveUserDataUseCase.execute(params: _params);
  }

  UserEntity mapUserEntity({required GoogleSignInUserEntity user}) {
    return UserEntity(
        localId: user.uid,
        role: UserRole.user.toShortString(),
        username: user.displayName,
        email: user.email,
        phone: user.phoneNumber,
        dateOfBirth: "",
        startDate: DateHelpers.getStartDate(),
        photo: user.photoURL,
        shippingAddress: '',
        billingAddress: '',
        idToken: user.refreshToken,
        provider: UserAuthProvider.google);
  }
}
