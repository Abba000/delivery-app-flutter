// ignore_for_file: file_names

import 'package:flutter_application_test/src/features/data/Decodables/Collections/CollectionsDecodable.dart';
import 'package:flutter_application_test/src/features/data/Interfaces/Interfaces.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/RealtimeDatabaseService/Interfaces/Interfaces.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/RealtimeDatabaseService/Services/RealtimeDatabaseService.dart';

class DefaultCollectionsRepository extends CollectionsRepository {
  final String _path = "collections/";

  // * Dependencies
  final RealtimeDataBaseService _realtimeDataBaseService;

  DefaultCollectionsRepository(
      {RealtimeDataBaseService? realtimeDataBaseService})
      : _realtimeDataBaseService =
            realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<CollectionsDecodable> fetchCollections() async {
    final response = await _realtimeDataBaseService.getData(path: _path);
    CollectionsDecodable decodable = CollectionsDecodable.fromMap(response);
    return decodable;
  }
}
