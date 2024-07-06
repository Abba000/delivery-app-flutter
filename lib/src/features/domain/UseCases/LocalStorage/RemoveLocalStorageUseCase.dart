// ignore_for_file: file_names

import 'package:flutter_application_test/src/features/data/Repositories/LocalStorage/RemoveLocalStorageStorage.dart';
import 'package:flutter_application_test/src/features/data/Interfaces/Interfaces.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/LocalStorage/LocalStorageUseCaseParameters.dart';

abstract class RemoveLocalStorageUseCase {
  Future<void> execute({required RemoveLocalStorageParameters parameters});
}

class DefaultRemoveLocalStorageUseCase extends RemoveLocalStorageUseCase {
  //DEPENDENCIAS

  final RemoveLocalStorageRepository _removeLocalStorageRepository;

  DefaultRemoveLocalStorageUseCase(
      {RemoveLocalStorageRepository? removeLocalStorageRepository})
      : _removeLocalStorageRepository = removeLocalStorageRepository ??
            DefaultRemoveLocalStorageRepository();

  @override
  Future<void> execute(
      {required RemoveLocalStorageParameters parameters}) async {
    return await _removeLocalStorageRepository.removeInLocalStorage(
        key: parameters.key);
  }
}
