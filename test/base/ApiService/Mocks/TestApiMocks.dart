// ignore_for_file: file_names

import 'dart:convert';

class CorrectPostBodyParams {
  String? title;
  String? body;
  int? userId;

  CorrectPostBodyParams({
    this.title,
    this.body,
    this.userId,
  });

  factory CorrectPostBodyParams.fromRawJson(String str) =>
      CorrectPostBodyParams.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CorrectPostBodyParams.fromJson(Map<String, dynamic> json) =>
      CorrectPostBodyParams(
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "userId": userId,
      };
}

class CorrectPutBodyParams {
  CorrectPutBodyParams({
    this.id,
    this.title,
    this.body,
    this.userId,
  });

  int? id;
  String? title;
  String? body;
  int? userId;

  factory CorrectPutBodyParams.fromJson(String str) => CorrectPutBodyParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CorrectPutBodyParams.fromMap(Map<String, dynamic> json) => CorrectPutBodyParams(
    id: json["id"],
    title: json["title"],
    body: json["body"],
    userId: json["userId"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "body": body,
    "userId": userId,
  };
}