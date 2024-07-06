// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

mixin LoadingStateProviderDelegate {
  bool isLoading = false;
  void setLoadingState({required bool isLoading});
}

class LoadingStateProvider extends ChangeNotifier
    with LoadingStateProviderDelegate {
  @override
  setLoadingState({required bool isLoading}) {
    this.isLoading = isLoading;
    notifyListeners();
  }
}

extension LoadingStateProviderExtension on BuildContext {
  setLoadingState({required bool isLoading}) =>
      Provider.of<LoadingStateProvider>(this, listen: false)
          .setLoadingState(isLoading: isLoading);
  isLoading() =>
      Provider.of<LoadingStateProvider>(this, listen: false).isLoading;
}
