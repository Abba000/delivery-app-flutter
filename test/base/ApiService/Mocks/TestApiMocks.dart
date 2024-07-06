// ignore_for_file: file_names

import 'dart:convert';

class CorrectPostExpectation {
  String? title;
  String? body;
  int? userId;

  CorrectPostExpectation({
    this.title,
    this.body,
    this.userId,
  });

  factory CorrectPostExpectation.fromJson(String str) =>
      CorrectPostExpectation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CorrectPostExpectation.fromMap(Map<String, dynamic> json) =>
      CorrectPostExpectation(
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "body": body,
        "userId": userId,
      };
}

class CorrectPutBodyParams {
  int? id;
  String? title;
  String? body;
  int? userId;

  CorrectPutBodyParams({
    this.id,
    this.title,
    this.body,
    this.userId,
  });

  factory CorrectPutBodyParams.fromJson(String str) =>
      CorrectPutBodyParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CorrectPutBodyParams.fromMap(Map<String, dynamic> json) =>
      CorrectPutBodyParams(
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
