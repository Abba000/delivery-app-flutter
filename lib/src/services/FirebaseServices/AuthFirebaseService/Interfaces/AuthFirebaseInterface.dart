// ignore_for_file: file_names

import '../../../../base/ApiService/ApiService.dart';

abstract class BaseAuthFirebaseService {
  ApiService apiService = DefaultApiService();
  static String baseUrl = "https://identitytoolkit.googleapis.com/v1/";
  static String adminToken = "AIzaSyDzThuzXZJFQJGZO73NqJc2DGfo1TnrNxk";
  static String signUpEndpoint = "accounts:signUp?key=";
  static String signInEndpoint = "accounts:signInWithPassword?key=";
  static String getUserDataEndpoint = "accounts:lookup?key=";
  static String updatePasswordEndpoint = "accounts:sendOobCode?key=";
  static String updateEmailEndpoint = "accounts:update?key=";
}

abstract class SignUpService extends BaseAuthFirebaseService {
  String endpoint = BaseAuthFirebaseService.baseUrl +
      BaseAuthFirebaseService.signUpEndpoint +
      BaseAuthFirebaseService.adminToken;
  Future<Map<String, dynamic>> signUp(
      {required Map<String, dynamic> bodyParameters});
}

abstract class SignInService extends BaseAuthFirebaseService {
  String endpoint = BaseAuthFirebaseService.baseUrl +
      BaseAuthFirebaseService.signInEndpoint +
      BaseAuthFirebaseService.adminToken;
  Future<Map<String, dynamic>> signIn(
      {required Map<String, dynamic> bodyParameters});
  Future<String> getIdToken({required Map<String, dynamic> bodyParameters});
}

abstract class GetUserDataService extends BaseAuthFirebaseService {
  String endpoint = BaseAuthFirebaseService.baseUrl +
      BaseAuthFirebaseService.getUserDataEndpoint +
      BaseAuthFirebaseService.adminToken;
  Future<Map<String, dynamic>> getUserData(
      {required Map<String, dynamic> bodyParameters});
}

abstract class UpdatePasswordUserService extends BaseAuthFirebaseService {
  String endpoint = BaseAuthFirebaseService.baseUrl +
      BaseAuthFirebaseService.updatePasswordEndpoint +
      BaseAuthFirebaseService.adminToken;
  Future<Map<String, dynamic>> updatePassword({required String email});
}

abstract class UpdateEmailUserService extends BaseAuthFirebaseService {
  String endpoint = BaseAuthFirebaseService.baseUrl +
      BaseAuthFirebaseService.updateEmailEndpoint +
      BaseAuthFirebaseService.adminToken;
  Future<Map<String, dynamic>> updateEmail(
      {required String oldEmail,
      required String newEmail,
      required String password});
}
