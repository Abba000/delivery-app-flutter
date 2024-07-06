// ignore_for_file: file_names

import 'package:flutter_application_test/src/base/Constants/LocalStorageKey.dart';
import 'package:flutter_application_test/src/features/data/Repositories/LocalStorage/SaveLocalStorageRepository.dart';
import 'package:flutter_application_test/src/features/data/Interfaces/Interfaces.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/LocalStorage/FetchLocalStorageUseCase.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/LocalStorage/LocalStorageUseCaseParameters.dart';

abstract class SaveLocalStorageUseCase {
  Future<void> execute(
      {required SaveLocalStorageParameters saveLocalParameteres});
  Future<void> saveRecentSearchInLocalStorage({required String placeId});
  Future<void> clearRecentSearchInLocalStorage();
}

class DefaultSaveLocalStorageUseCase extends SaveLocalStorageUseCase {
  // * Dependencies
  final SaveLocalStorageRepository _saveLocalStorageRepository;
  final FetchLocalStorageUseCase _fetchLocalStorageUseCase;

  DefaultSaveLocalStorageUseCase(
      {SaveLocalStorageRepository? saveLocalStorageRepository,
      FetchLocalStorageUseCase? fetchLocalStorageUseCase})
      : _saveLocalStorageRepository =
            saveLocalStorageRepository ?? DefaultSaveLocalStorageRepository(),
        _fetchLocalStorageUseCase =
            fetchLocalStorageUseCase ?? DefaultFetchLocalStorageUseCase();

  @override
  Future<void> execute(
      {required SaveLocalStorageParameters saveLocalParameteres}) async {
    _saveLocalStorageRepository.saveInLocalStorage(
        key: saveLocalParameteres.key, value: saveLocalParameteres.value);
  }

  @override
  Future<void> saveRecentSearchInLocalStorage({required String placeId}) async {
    final placeIds = await _fetchLocalStorageUseCase.fetchRecentSearches();
    if (!placeIds.contains(placeId)) {
      placeIds.add(placeId);
      return _saveLocalStorageRepository.saveRecentSearchInLocalStorage(
          key: LocalStorageKeys.recentSearches, value: placeIds);
    }
  }

  @override
  Future<void> clearRecentSearchInLocalStorage() {
    return _saveLocalStorageRepository.saveRecentSearchInLocalStorage(
        key: LocalStorageKeys.recentSearches, value: []);
  }
}
