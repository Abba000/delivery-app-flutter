// ignore_for_file: file_names

import 'package:flutter_application_test/src/features/domain/UseCases/Auth/SignOutUseCase/SignOutUseCase.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/LoadingStatusProvider.dart';

abstract class ProfileTabViewModelInput {
  late LoadingStateProvider loadingStatusState;
  Future<void> signOut();
  void initState({required LoadingStateProvider loadingState});
}

// Crear ViewModel
abstract class ProfileTabViewModel extends ProfileTabViewModelInput {}

class DefaultProfileTabViewModel extends ProfileTabViewModel {
  // UseCases
  final SignOutUseCase _signOutUseCase;

  DefaultProfileTabViewModel({SignOutUseCase? signOutUseCase})
      : _signOutUseCase = signOutUseCase ?? DefaulSignOutUseCase();

  @override
  void initState({required LoadingStateProvider loadingState}) {
    loadingStatusState = loadingState;
  }

  @override
  Future<void> signOut() async {
    loadingStatusState.setLoadingState(isLoading: true);

    return _signOutUseCase.execute().then((_) {
      loadingStatusState.setLoadingState(isLoading: false);
    });
  }
}
