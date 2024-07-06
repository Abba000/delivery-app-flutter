import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/base/Views/BaseView.dart';
import 'package:flutter_application_test/src/features/presentation/Error/ErrorAlertView.dart';
import 'package:flutter_application_test/src/features/presentation/Tabs/explore_tab/View/Components/ExploreTabContentView.dart';
import 'package:flutter_application_test/src/features/presentation/Tabs/explore_tab/ViewModel/ExploreTabViewModel.dart';
import 'package:flutter_application_test/src/services/GeolocationServices/Services/GeolocationService.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({Key? key}) : super(key: key);

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> with BaseView {
  final ExploreViewModel viewModel;

  _ExploreTabState({ExploreViewModel? exploreViewModel})
      : viewModel = exploreViewModel ?? DefaultExploreViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder(
            future: viewModel.viewInitState(),
            builder: (BuildContext context,
                AsyncSnapshot<ExploreViewModelState> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return loadingView;
                case ConnectionState.done:
                  if (snapshot.error ==
                          GeoLocationFailureMessages
                              .locationPermissionsDenied ||
                      snapshot.error ==
                          GeoLocationFailureMessages
                              .locationPermissionsDeniedForever) {
                    var errorView = ErrorView();
                    errorView.isLocationDeniedError = true;
                    return errorView;
                  }
                  switch (snapshot.data) {
                    case ExploreViewModelState.viewLoadedState:
                      return ExploreTabContentView(viewModel: viewModel);
                    default:
                      return ErrorView();
                  }
                default:
                  return loadingView;
              }
            }));
  }
}
