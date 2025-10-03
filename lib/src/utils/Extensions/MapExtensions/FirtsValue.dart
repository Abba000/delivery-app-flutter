// ignore_for_file: no_leading_underscores_for_local_identifiers, file_names

extension FirstValue on Map {
  Map<String, dynamic> getFirtsValue() {
    var _list = values.toList();
    Map<String, dynamic> model = _list[0];

    return model;
  }
}
