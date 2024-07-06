// ignore_for_file: file_names

import 'dart:convert';

class CollectionsDecodable {
  CollectionsDecodable({
    required this.collections,
  });

  final List<Collection>? collections;

  factory CollectionsDecodable.fromJson(String str) =>
      CollectionsDecodable.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CollectionsDecodable.fromMap(Map<String, dynamic> json) =>
      CollectionsDecodable(
        collections: json["collections"] == null
            ? null
            : List<Collection>.from(
                json["collections"].map((x) => Collection.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "collections": collections == null
            ? null
            : List<dynamic>.from(collections!.map((x) => x.toMap())),
      };
}

class Collection {
  Collection({
    required this.id,
    required this.img,
    required this.name,
  });

  final int id;
  final String img;
  final String name;

  factory Collection.fromJson(String str) =>
      Collection.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Collection.fromMap(Map<String, dynamic> json) => Collection(
        id: json["id"],
        img: json["img"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "img": img,
        "name": name,
      };
}
