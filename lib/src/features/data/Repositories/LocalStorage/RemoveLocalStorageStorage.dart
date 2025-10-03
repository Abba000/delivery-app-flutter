// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

abstract class RemoveLocalStorageRepository {
  Future<void> removeInLocalStorage({required String key});
}

class DefaultRemoveLocalStorageRepository extends RemoveLocalStorageRepository {
  // * Dependencies
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future removeInLocalStorage({required String key}) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.remove(key);
  }
}
