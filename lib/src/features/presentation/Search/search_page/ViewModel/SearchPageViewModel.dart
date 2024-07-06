// ignore_for_file: file_names

import '../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../../../../domain/UseCases/LocalStorage/FetchLocalStorageUseCase.dart';
import '../../../../domain/UseCases/LocalStorage/SaveLocalStorageUseCase.dart';
import '../../../../domain/UseCases/Places/PlaceListUseCase/PlaceListUseCase.dart';

abstract class SearchPageViewModelInput {
  Future<PlaceListEntity> fetchPlacesListByQuery({required String query});
  Future<PlaceListEntity> fetchPlacesListByRecentSearches();
  Future<PlaceListEntity> fetchPopularPlacesList();
  Future<void> clearRecentSearchInLocalStorage();
}

abstract class SearchPageViewModel extends SearchPageViewModelInput {}

class DefaultSearchPageViewModel extends SearchPageViewModel {
  // Dependencies
  final PlaceListUseCase _placeListUseCase;
  final FetchLocalStorageUseCase _fetchLocalStorageUseCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  DefaultSearchPageViewModel(
      {PlaceListUseCase? placeListUseCase,
      FetchLocalStorageUseCase? fetchLocalStorageUseCase,
      SaveLocalStorageUseCase? saveLocalStorageUseCase})
      : _placeListUseCase = placeListUseCase ?? DefaultPlaceListUseCase(),
        _fetchLocalStorageUseCase =
            fetchLocalStorageUseCase ?? DefaultFetchLocalStorageUseCase(),
        _saveLocalStorageUseCase =
            saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  @override
  Future<PlaceListEntity> fetchPlacesListByQuery({required String query}) {
    return _placeListUseCase.fetchPlacesListByQuery(query: query);
  }

  @override
  Future<PlaceListEntity> fetchPlacesListByRecentSearches() async {
    final placeIds = await _fetchLocalStorageUseCase.fetchRecentSearches();
    return _placeListUseCase.fetchPlacesListByRecentSearches(
        placeIds: placeIds);
  }

  @override
  Future<PlaceListEntity> fetchPopularPlacesList() {
    return _placeListUseCase.fetchPopularPlacesList();
  }

  @override
  Future<void> clearRecentSearchInLocalStorage() {
    return _saveLocalStorageUseCase.clearRecentSearchInLocalStorage();
  }
}
