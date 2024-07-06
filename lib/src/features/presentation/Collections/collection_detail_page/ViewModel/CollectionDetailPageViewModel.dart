// ignore_for_file: unused_field, file_names

import '../../../../domain/Entities/Collections/CollectionsEntity.dart';
import '../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../../../../domain/UseCases/Places/FavouritesPlacesUseCase/FavouritesPlacesUseCase.dart';
import '../../../../domain/UseCases/Places/PlaceListUseCase/PlaceListUseCase.dart';

enum CollectionDetailPageViewState { viewLoadedState }

abstract class CollectionDetailPageViewModelInput {
  Future<CollectionDetailPageViewState> viewInitState();
  CollectionDetailEntity getCollection();
  List<PlaceDetailEntity> filteredPlacesByCategory = [];
}

abstract class CollectionDetailPageViewModel
    extends CollectionDetailPageViewModelInput {}

class DefaultCollectionDetailPageViewModel
    extends CollectionDetailPageViewModel {
  // Dependencies
  CollectionDetailEntity collection;
  final PlaceListUseCase _placeListUseCase;
  final FavouritesPlacesUseCase _favouritesPlacesUseCase;

  DefaultCollectionDetailPageViewModel(
      {required this.collection,
      PlaceListUseCase? placeListUseCase,
      FavouritesPlacesUseCase? favouritesPlacesUseCase})
      : _placeListUseCase = placeListUseCase ?? DefaultPlaceListUseCase(),
        _favouritesPlacesUseCase =
            favouritesPlacesUseCase ?? DefaultFavouritesPlacesUseCase();

  @override
  Future<CollectionDetailPageViewState> viewInitState() async {
    final placesResult = await _placeListUseCase.fetchPlacesListByCategory(
        categoryId: collection.id);
    filteredPlacesByCategory = placesResult.placeList ?? [];
    return CollectionDetailPageViewState.viewLoadedState;
  }

  @override
  CollectionDetailEntity getCollection() {
    return collection;
  }
}
