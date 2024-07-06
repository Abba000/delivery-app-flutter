// ignore_for_file: file_names

import 'package:flutter_application_test/src/features/domain/Entities/Collections/CollectionsEntity.dart';
import 'package:flutter_application_test/src/features/domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/Collections/FetchCollectionsUseCase.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/Places/PlaceListUseCase/PlaceListUseCase.dart';

enum ExploreViewModelState { viewLoadedState, errorState }

abstract class ExploreViewModelInput {
  Future<ExploreViewModelState> viewInitState();
  List<PlaceDetailEntity> noveltyPlaces = [];
  List<PlaceDetailEntity> popularPlaces = [];
  List<CollectionDetailEntity> collections = [];
}

// Crear ViewModel
abstract class ExploreViewModel extends ExploreViewModelInput {}

class DefaultExploreViewModel extends ExploreViewModel {
  // Dependencies
  final PlaceListUseCase _placeListUseCase;
  final FetchCollectionUseCase _fetchCollectionUseCase;

  DefaultExploreViewModel(
      {PlaceListUseCase? placeListUseCase,
      FetchCollectionUseCase? fetchCollectionUseCase})
      : _placeListUseCase = placeListUseCase ?? DefaultPlaceListUseCase(),
        _fetchCollectionUseCase =
            fetchCollectionUseCase ?? DefaultFetchCollectionUseCase();

  @override
  Future<ExploreViewModelState> viewInitState() async {
    final noveltyPlacesResult = await _placeListUseCase.fetchNoveltyPlaceList();
    noveltyPlaces = noveltyPlacesResult.placeList ?? [];

    final popularPlacesResult =
        await _placeListUseCase.fetchPopularPlacesList();
    popularPlaces = popularPlacesResult.placeList ?? [];

    final collectionsResponse = await _fetchCollectionUseCase.execute();
    collections = collectionsResponse.collections ?? [];

    if (noveltyPlaces.isNotEmpty ||
        popularPlaces.isNotEmpty ||
        collections.isNotEmpty) {
      return ExploreViewModelState.viewLoadedState;
    } else {
      return ExploreViewModelState.errorState;
    }
  }
}
