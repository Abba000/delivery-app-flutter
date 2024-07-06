// ignore_for_file: file_names

import 'package:flutter_application_test/src/services/GeolocationServices/Interfaces/GeolocationServiceInterface.dart';
import 'package:geolocator/geolocator.dart';

class DefaultGeolocationHelpersService extends GeolocationHelpersService {
  @override
  double getDistanceBetweenInMetters(
      double startLatitude,
      double startLongitude,
      double destinationLatitude,
      double destinationLongitude) {
    double distanceInMeters = Geolocator.distanceBetween(startLatitude,
        startLongitude, destinationLatitude, destinationLongitude);
    // Printable.printMessageOnConsole("$distanceInMeters - ", "Distance in Metters");
    return distanceInMeters;
  }

  @override
  double getDistanceBetweenInKilometters(
      double startLatitude,
      double startLongitude,
      double destinationLatitude,
      double destinationLongitude) {
    double distanceInKilometters = Geolocator.distanceBetween(startLatitude,
            startLongitude, destinationLatitude, destinationLongitude) /
        1000;
    //  Printable.printMessageOnConsole("$distanceInKilometters - ", "Distance in Kilometters");
    return distanceInKilometters;
  }
}
