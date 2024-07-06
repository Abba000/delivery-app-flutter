// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/base/Views/LoadingView.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/MainCordinator/MainCordinator.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/ErrorStateProvider.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/LoadingStatusProvider.dart';

mixin BaseView {
  final Widget loadingView = const LoadingView();
  final MainCoordinator coordinator = MainCoordinator();
  final ErrorStateProvider errorStateProvider = ErrorStateProvider();
  BaseViewStateDelegate? viewStateDelegate;
}

mixin BaseViewStateDelegate {
  void onChange();
}

mixin BaseViewModel {
  void initState({required LoadingStateProvider loadingState});
  // Exposed Properties
  late LoadingStateProvider loadingStatusState;
}
