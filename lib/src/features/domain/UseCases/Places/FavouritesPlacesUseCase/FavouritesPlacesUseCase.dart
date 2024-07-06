// ignore_for_file: file_names, override_on_non_overriding_member

import '../../../../../Managers/PlacesManger/Decodables/PlaceList/PlaceListDecodable.dart';
import '../../../../../base/Constants/ErrorMessage.dart';
import '../../../../data/Repositories/Places/PlaceDetail/PlaceDetailRepository.dart';
import '../../../Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../PlaceListUseCase/PlaceListUseCase.dart';

abstract class FavouritesPlacesUseCase {
  Future<PlaceListEntity> fetchFavouritesPlaces({required String localId});
  Future<void> saveOrRemoveUserFromPlaceFavourites(
      {required String placeId,
      required String localId,
      required bool isFavourite});
  Future<bool> isUserFavouritePlace(
      {required String localId, required String placeId});
}

class DefaultFavouritesPlacesUseCase extends FavouritesPlacesUseCase {
  // Dependencies
  final PlaceListUseCase _placeListUseCase;
  final PlaceDetailRepository _placeDetailRepository;

  DefaultFavouritesPlacesUseCase(
      {PlaceListUseCase? placeListUseCase,
      PlaceDetailRepository? placeDetailRepository})
      : _placeListUseCase = placeListUseCase ?? DefaultPlaceListUseCase(),
        _placeDetailRepository =
            placeDetailRepository ?? DefaultPlaceDetailRepository();

  @override
  Future<PlaceListEntity> fetchFavouritesPlaces(
      {required String localId}) async {
    var placeList = await _placeListUseCase.fetchPlaceList();
    placeList.placeList = placeList.placeList
        ?.where((place) => place.favourites.contains(localId))
        .toList();
    return placeList;
  }

  @override
  Future<void> saveOrRemoveUserFromPlaceFavourites(
      {required String placeId,
      required String localId,
      required bool isFavourite}) {
    if (isFavourite) {
      return _saveUserInFavourites(placeId: placeId, localId: localId);
    } else {
      return _removeUserFromFavourites(placeId: placeId, localId: localId);
    }
  }

  @override
  Future<void> _saveUserInFavourites(
      {required String placeId, required String localId}) async {
    var placeList = await _placeListUseCase.fetchPlaceList();
    var placeDetail =
        placeList.placeList?.firstWhere((place) => place.placeId == placeId);
    placeDetail?.favourites.add(localId);
    if (placeDetail == null) {
      return Future.error(AppFailureMessages.unExpectedErrorMessage);
    }

    return _placeDetailRepository.savePlaceDetail(
        placeDetail: PlaceDetailDecodable.fromMap(placeDetail.toMap()));
  }

  @override
  Future<void> _removeUserFromFavourites(
      {required String placeId, required String localId}) async {
    var placeList = await _placeListUseCase.fetchPlaceList();
    var placeDetail =
        placeList.placeList?.firstWhere((place) => place.placeId == placeId);
    placeDetail?.favourites.remove(localId);
    if (placeDetail == null) {
      return Future.error(AppFailureMessages.unExpectedErrorMessage);
    }
    return _placeDetailRepository.savePlaceDetail(
        placeDetail: PlaceDetailDecodable.fromMap(placeDetail.toMap()));
  }

  @override
  Future<bool> isUserFavouritePlace(
      {required String localId, required String placeId}) async {
    PlaceListEntity places = await fetchFavouritesPlaces(localId: localId);
    bool isUserFavouritePlace = places.placeList
            ?.where((place) => place.placeId == placeId)
            .isNotEmpty ??
        false;
    return isUserFavouritePlace;
  }
}
