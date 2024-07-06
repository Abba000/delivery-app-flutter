// ignore_for_file: file_names

import 'package:flutter_application_test/src/base/ApiService/AppError.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/Geolocation/GeolocationUseCaseParameters.dart';
import 'package:flutter_application_test/src/services/GeolocationServices/Entities/GeolocationServicesEntity.dart';
import 'package:flutter_application_test/src/services/GeolocationServices/Interfaces/GeolocationServiceInterface.dart';
import 'package:flutter_application_test/src/services/GeolocationServices/Services/GeolocationService.dart';
import 'package:flutter_application_test/src/services/GeolocationServices/Services/GeolocationServiceHelper.dart';
import 'package:flutter_application_test/src/utils/Helpers/Printable/PrintableHelper.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';

abstract class GeolocationUseCase {
  Future<Result<PositionEntity, Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermissionStatus();
  Future<double> getDistanceBetweenYourCurrentPositionAnd(
      Destination destination);
}

class DefaultGeolocationUseCase extends GeolocationUseCase {
  // Dependencies
  final GeolocationService _geolocationService;
  final GeolocationHelpersService _geolocationHelpersService;

  DefaultGeolocationUseCase(
      {GeolocationService? geolocationService,
      GeolocationHelpersService? geolocationHelpersService})
      : _geolocationService = geolocationService ??
            DefaultGeolocationService(), // Bueno: DefaultGeolocationService() Mock: MockSuccessGeolocationService
        _geolocationHelpersService =
            geolocationHelpersService ?? DefaultGeolocationHelpersService();

  @override
  Future<Result<PositionEntity, Failure>> getCurrentPosition() {
    return _geolocationService.getCurrentPosition();
  }

  @override
  Future<LocationPermissionStatus> getPermissionStatus() async {
    final status = await _geolocationService.getPermissionStatus();
    Printable.printMessageOnConsole("$status", "LocationPermission");
    return status;
  }

  @override
  Future<double> getDistanceBetweenYourCurrentPositionAnd(
      Destination destination) async {
    final currentPosition = await _geolocationService.getCurrentPosition();
    final distance = _geolocationHelpersService.getDistanceBetweenInKilometters(
        currentPosition.value?.latitude ?? 0.0,
        currentPosition.value?.longitude ?? 0.0,
        destination.destinationLatitude,
        destination.destinationLongitude);
    return distance;
  }
}
