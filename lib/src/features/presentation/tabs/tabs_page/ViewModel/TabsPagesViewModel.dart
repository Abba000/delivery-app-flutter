// ignore_for_file: file_names

import 'package:flutter_application_test/src/base/ApiService/AppError.dart';
import 'package:flutter_application_test/src/base/Views/BaseView.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/Geolocation/GeolocationUseCase.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/LoadingStatusProvider.dart';
import 'package:flutter_application_test/src/services/GeolocationServices/Entities/GeolocationServicesEntity.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';

abstract class TabsViewModelInput {
  // Exposed Methods
  Future<Result<bool, Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermissionStatus();
}

abstract mixin class TabsViewModelOutput {}

// Crear ViewModel
abstract class TabsViewModel extends TabsViewModelInput
    with TabsViewModelOutput, BaseViewModel {}

class DefaultTabsViewModel extends TabsViewModel {
  // Dependencies
  final GeolocationUseCase _geolocationUseCase;

  DefaultTabsViewModel({GeolocationUseCase? geolocationUseCase})
      : _geolocationUseCase = geolocationUseCase ?? DefaultGeolocationUseCase();

  @override
  void initState({required LoadingStateProvider loadingState}) {
    loadingStatusState = loadingState;
  }

  @override
  Future<Result<bool, Failure>> getCurrentPosition() async {
    return await _geolocationUseCase.getCurrentPosition().then((result) {
      switch (result.status) {
        case ResultStatus.success:
          return Result.success(true);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }

  @override
  Future<LocationPermissionStatus> getPermissionStatus() async {
    return await _geolocationUseCase.getPermissionStatus();
  }
}
