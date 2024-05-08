import 'dart:convert';
import 'dart:io';

import 'package:flutter_application_test/src/base/ApiService/AppError.dart';
import 'package:http/http.dart' as http;

abstract class _Exeptions {
  static String socketExceptionMessage = "No Internet connection";
  static String httpException = "Couldn't find the path";
  static String formatException = "Bad response format";
}

abstract class Apiservice {
  Future<Map<String, dynamic>> getDataFromPostRequest(
      {required Map<String, dynamic> bodyParameters,
      required String url,
      Map<String, String>? headers});

  Future<Map<String, dynamic>> getDataFromPutRequest(
      {required Map<String, dynamic> bodyParameters,
      required String url,
      Map<String, String>? headers});

  Future<Map<String, dynamic>> getDataFromGetRequest(
      {required String url, Map<String, String>? headers});
}

class DefaultApiService extends Apiservice {
  @override
  Future<Map<String, dynamic>> getDataFromGetRequest(
      {required String url, Map<String, String>? headers}) async {
    final url0 = Uri.parse(url);
    final response = await http.get(url0, headers: headers);

    try {
      if (response.statusCode.toString().contains('20')) {
        var jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        throw Failure.fromBody(body: response.body);
      }
    } on SocketException {
      throw Failure.fromMessage(message: _Exeptions.socketExceptionMessage);
    } on HttpException {
      throw Failure.fromMessage(message: _Exeptions.httpException);
    } on FormatException {
      throw Failure.fromMessage(message: _Exeptions.formatException);
    }
  }

  @override
  Future<Map<String, dynamic>> getDataFromPostRequest(
      {required Map<String, dynamic> bodyParameters,
      required String url,
      Map<String, String>? headers}) async {
    final url0 = Uri.parse(url);
    final body = json.encode(bodyParameters);
    final response = await http.post(url0, headers: headers, body: body);

    try {
      if (response.statusCode.toString().contains('20')) {
        var jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        throw Failure.fromBody(body: response.body);
      }
    } on SocketException {
      throw Failure.fromMessage(message: _Exeptions.socketExceptionMessage);
    } on HttpException {
      throw Failure.fromMessage(message: _Exeptions.httpException);
    } on FormatException {
      throw Failure.fromMessage(message: _Exeptions.formatException);
    }
  }

  @override
  Future<Map<String, dynamic>> getDataFromPutRequest(
      {required Map<String, dynamic> bodyParameters,
      required String url,
      Map<String, String>? headers}) async {
    final url0 = Uri.parse(url);
    final body = json.encode(bodyParameters);
    final response = await http.put(url0, headers: headers, body: body);

    try {
      if (response.statusCode.toString().contains('20')) {
        var jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        throw Failure.fromBody(body: response.body);
      }
    } on SocketException {
      throw Failure.fromMessage(message: _Exeptions.socketExceptionMessage);
    } on HttpException {
      throw Failure.fromMessage(message: _Exeptions.httpException);
    } on FormatException {
      throw Failure.fromMessage(message: _Exeptions.formatException);
    }
  }
}
