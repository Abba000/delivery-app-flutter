// ignore_for_file: file_names

import 'package:flutter_application_test/src/Managers/PlacesManger/Decodables/PlaceList/PlaceListDecodable.dart';
import 'package:flutter_application_test/src/base/ApiService/AppError.dart';
import 'package:flutter_application_test/src/features/data/Decodables/Auth/UserAuthData/UserAuthDataDecodable.dart';
import 'package:flutter_application_test/src/features/data/Decodables/Collections/CollectionsDecodable.dart';
import 'package:flutter_application_test/src/features/data/Decodables/User/UserDecodable.dart';
import 'package:flutter_application_test/src/features/data/Repositories/Auth/SignUpRepository/SignUpBodyParameters.dart';
import 'package:flutter_application_test/src/features/data/Repositories/Auth/UserData/GetUserDataRepositoryParameters.dart';
import 'package:flutter_application_test/src/features/data/Repositories/User/UserBodyParameters.dart';
import 'package:flutter_application_test/src/features/data/Repositories/Auth/SignInRepository/SignInBodyParameters.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/AuthFirebaseService/Decodables/SignInDecodable.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/AuthFirebaseService/Decodables/SignUpDecodable.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/AuthFirebaseService/Decodables/UpdatePasswordDecodable.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';

import '../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';

abstract class SignInRepositorty {
  Future<Result<SignInDecodable, Failure>> signIn(
      {required SignInBodyParameters params});
}

abstract class SignUpRepository {
  Future<Result<SignUpDecodable, Failure>> signUp(
      {required SignUpBodyParameters params});
}

abstract class GetAuthUserDataRepository {
  Future<Result<UserAuthDataDecodable, Failure>> getUserData(
      {required GetUserDataBodyParameters params});
}

abstract class UpdatePasswordRepository {
  Future<Result<UpdatePasswordDecodable, Failure>> updatePassword(
      {required String email});
}

abstract class UpdateEmailRepository {
  Future<dynamic> updateEmail(
      {required String oldEmail,
      required String newEmail,
      required String password});
}

abstract class UserAuthDataRepository {
  Future<Result<UserAuthDataDecodable, Failure>> getUserAuthData(
      {required GetUserDataBodyParameters parameters});
}

//User Data Repositories
abstract class SaveUserDataRepository {
  Future<Result<UserDecodable, Failure>> saveUserData(
      {required UserBodyParameters params});
}

abstract class FetchUserDataRepository {
  Future<Result<UserDecodable, Failure>> fetchUserData(
      {required String localId});
}

// * LocalStorage Repositories
abstract class SaveLocalStorageRepository {
  Future<void> saveInLocalStorage({required String key, required String value});
  Future<void> saveRecentSearchInLocalStorage(
      {required String key, required List<String> value});
}

abstract class FetchLocalStorageRepository {
  Future<String?> fetchInLocalStorage({required String key});
  Future<List<String>?> fetchRecentSearches();
}

abstract class RemoveLocalStorageRepository {
  Future<void> removeInLocalStorage({required String key});
}

// * Collections Repositories
abstract class CollectionsRepository {
  Future<CollectionsDecodable> fetchCollections();
}

// * Places Repositories
abstract class PlaceListRepository {
  Future<PlaceListDecodable> fetchPlaceList();
  Future<PlaceListDecodable> fetchNoveltyPlaceList();
  Future<PlaceListDecodable> fetchPopularPlacesList();
  Future<PlaceListDecodable> fetchPlacesListByCategory(
      {required int categoryId});
  Future<PlaceListDecodable> fetchPlacesListByQuery({required String query});
  Future<PlaceListDecodable> fetchPlacesListByRecentSearches(
      {required List<String> placeIds});
}

abstract class PlaceDetailRepository {
  Future<void> savePlaceDetail({required PlaceDetailEntity placeDetail});
}
