// ignore_for_file: file_names

import 'dart:convert';

class AuthErrorDecodable {
  OutErrorDecodableError? error;

  AuthErrorDecodable({
    this.error,
  });

  factory AuthErrorDecodable.fromJson(String str) =>
      AuthErrorDecodable.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthErrorDecodable.fromMap(Map<String, dynamic> json) =>
      AuthErrorDecodable(
        error: json["error"] == null
            ? null
            : OutErrorDecodableError.fromMap(json["error"]),
      );

  Map<String, dynamic> toMap() => {
        "error": error?.toMap(),
      };
}

class OutErrorDecodableError {
  int? code;
  String? message;
  List<ErrorElement>? errors;

  OutErrorDecodableError({
    this.code,
    this.message,
    this.errors,
  });

  factory OutErrorDecodableError.fromJson(String str) =>
      OutErrorDecodableError.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OutErrorDecodableError.fromMap(Map<String, dynamic> json) =>
      OutErrorDecodableError(
        code: json["code"],
        message: json["message"],
        errors: json["errors"] == null
            ? []
            : List<ErrorElement>.from(
                json["errors"]!.map((x) => ErrorElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "errors": errors == null
            ? []
            : List<dynamic>.from(errors!.map((x) => x.toMap())),
      };
}

class ErrorElement {
  String? message;
  String? domain;
  String? reason;

  ErrorElement({
    this.message,
    this.domain,
    this.reason,
  });

  factory ErrorElement.fromJson(String str) =>
      ErrorElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ErrorElement.fromMap(Map<String, dynamic> json) => ErrorElement(
        message: json["message"],
        domain: json["domain"],
        reason: json["reason"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "domain": domain,
        "reason": reason,
      };
}
