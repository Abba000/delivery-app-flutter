// ignore_for_file: file_names

extension Key on Map {
  String getRandomKey() {
    String key = "";
    for (var k in entries) {
      key = k.key;
    }
    return key;
  }
}
