// ignore_for_file: file_names

import 'package:flutter_application_test/src/base/Constants/LocalStorageKey.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/LocalStorage/RemoveLocalStorageUseCase.dart';

abstract class SignOutUseCase {
  Future<void> execute();
}

class DefaulSignOutUseCase extends SignOutUseCase {
  //Dependencias

  final RemoveLocalStorageUseCase _removeLocalStorageUseCase;

  DefaulSignOutUseCase({RemoveLocalStorageUseCase? removeLocalStorageUseCase})
      : _removeLocalStorageUseCase =
            removeLocalStorageUseCase ?? DefaultRemoveLocalStorageUseCase();

  @override
  Future<void> execute() {
    return _removeLocalStorageUseCase.execute(
        parameters:
            RemoveLocalStorageParameters(key: LocalStorageKeys.idToken));
  }
}
