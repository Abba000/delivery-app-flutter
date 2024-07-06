// ignore_for_file: file_names

import 'package:flutter_application_test/src/Managers/PlacesManger/Decodables/PlaceList/PlaceListDecodable.dart';

abstract class PlacesManager {
  Future<PlaceListDecodable> fetchPlaceList();
  Future<PlaceListDecodable> fetchNoveltyPlaceList();
  Future<PlaceListDecodable> fetchPopularPlacesList();
  Future<PlaceListDecodable> fetchPlacesListByCategory(
      {required int categoryId});
  Future<PlaceListDecodable> fetchPlacesListByQuery({required String query});
  Future<PlaceListDecodable> fetchPlacesListByRecentSearches(
      {required List<String> placeIds});
}
