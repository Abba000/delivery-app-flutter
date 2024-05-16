// ignore_for_file: file_names

import 'package:flutter_application_test/src/base/ApiService/ApiService.dart';

abstract class BaseFirebaseService {
  ApiService apiService = DefaultApiService();
  static String baseUrl = "https://identitytoolkit.googleapis.com/v1/";
  static String adminToken = "AIzaSyDzThuzXZJFQJGZO73NqJc2DGfo1TnrNxk";
  static String signUpEndpoint = "accounts:signUp?key=";
  static String signInEndpoint = "accounts:signInWithPassword?key=";
}

abstract class SignUpService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl +
      BaseFirebaseService.signUpEndpoint +
      BaseFirebaseService.adminToken;
  Future<Map<String, dynamic>> signUp(
      {required Map<String, dynamic> bodyParameters});
}

abstract class SignInService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl +
      BaseFirebaseService.signInEndpoint +
      BaseFirebaseService.adminToken;
  Future<Map<String, dynamic>> signIn(
      {required Map<String, dynamic> bodyParameters});
}
