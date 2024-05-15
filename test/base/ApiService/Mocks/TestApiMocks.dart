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
