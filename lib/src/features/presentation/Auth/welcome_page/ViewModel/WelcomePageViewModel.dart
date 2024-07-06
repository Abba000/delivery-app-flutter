// ignore_for_file: file_names

import 'package:flutter_application_test/src/base/ApiService/AppError.dart';
import 'package:flutter_application_test/src/base/Views/BaseView.dart';
import 'package:flutter_application_test/src/features/domain/Entities/User/UserEntity.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/Auth/GoogleSignInUseCase/GoogleSignInUseCase.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/LoadingStatusProvider.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';

abstract class WelcomePageViewModelInput {
  Future<Result<UserEntity, Failure>> signInWithGoogle();
}

abstract class WelcomePageViewModel extends WelcomePageViewModelInput
    with BaseViewModel {}

class DefaultWelcomePageViewModel extends WelcomePageViewModel {
  // Dependencias
  final GoogleSignInUseCase _googleSignInUseCase;

  DefaultWelcomePageViewModel({GoogleSignInUseCase? googleSignInUseCase})
      : _googleSignInUseCase =
            googleSignInUseCase ?? DefaultGoogleSignInUseCase();

  @override
  Future<Result<UserEntity, Failure>> signInWithGoogle() {
    return _googleSignInUseCase.execute();
  }

  @override
  void initState({required LoadingStateProvider loadingState}) {
    loadingStatusState = loadingState;
  }
}
