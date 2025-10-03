// ignore_for_file: file_names

import 'package:flutter_application_test/src/features/data/Repositories/LocalStorage/FetchLocalStorageRepository.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/LocalStorage/LocalStorageUseCaseParameters.dart';

abstract class FetchLocalStorageUseCase {
  Future<String?> execute(
      {required FetchLocalStorageParameters fetchLocalParameteres});
  Future<List<String>> fetchRecentSearches();
}

class DefaultFetchLocalStorageUseCase extends FetchLocalStorageUseCase {
  // * Dependencies
  final FetchLocalStorageRepository _fetchLocalStorageRepository;

  DefaultFetchLocalStorageUseCase(
      {FetchLocalStorageRepository? fetchLocalStorageRepository})
      : _fetchLocalStorageRepository =
            fetchLocalStorageRepository ?? DefaultFetchLocalStorageRepository();

  @override
  Future<String?> execute(
      {required FetchLocalStorageParameters fetchLocalParameteres}) async {
    return await _fetchLocalStorageRepository.fetchInLocalStorage(
        key: fetchLocalParameteres.key);
  }

  @override
  Future<List<String>> fetchRecentSearches() async {
    final recentSearches =
        await _fetchLocalStorageRepository.fetchRecentSearches();
    return recentSearches ?? [];
  }
}
