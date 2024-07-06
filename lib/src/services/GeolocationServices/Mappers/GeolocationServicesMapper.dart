// ignore_for_file: file_names

import 'package:flutter_application_test/src/services/GeolocationServices/Entities/GeolocationServicesEntity.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationServiceMappers {
  static PositionEntity mapPosition(Position position) {
    /*
    Printable.printMessageOnConsole("${position.latitude}", "latitude");
    Printable.printMessageOnConsole("${position.longitude}", "longitude");

    Simulador
    I/flutter (14723): 37.421998333333335 - LAT
    I/flutter (14723): -122.084 - LNG

    Reales del centro de Barcelona para pruebas
    41.385599 - LAT
    2.169867 - LNG
    */
    return PositionEntity(
        longitude: position.longitude,
        latitude: position.latitude,
        timestamp: position.timestamp,
        accuracy: position.accuracy,
        altitude: position.altitude,
        heading: position.heading,
        speed: position.speed,
        speedAccuracy: position.speedAccuracy);
  }
}
