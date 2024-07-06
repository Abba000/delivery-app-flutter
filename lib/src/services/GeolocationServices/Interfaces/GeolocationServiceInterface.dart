// ignore_for_file: file_names

import 'package:flutter_application_test/src/base/ApiService/AppError.dart';
import 'package:flutter_application_test/src/services/GeolocationServices/Entities/GeolocationServicesEntity.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';

abstract class GeolocationService {
  Future<Result<PositionEntity, Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermissionStatus();
}

abstract class GeolocationHelpersService {
  double getDistanceBetweenInMetters(
      double startLatitude,
      double startLongitude,
      double destinationLatitude,
      double destinationLongitude);
  double getDistanceBetweenInKilometters(
      double startLatitude,
      double startLongitude,
      double destinationLatitude,
      double destinationLongitude);
}
