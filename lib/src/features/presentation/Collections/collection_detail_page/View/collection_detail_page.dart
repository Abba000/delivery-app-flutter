// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../../../../base/Views/BaseView.dart';
import '../../../Error/ErrorAlertView.dart';
import '../ViewModel/CollectionDetailPageViewModel.dart';
import 'Components/CollectionDetailPageContentView.dart';

class CollectionDetailPage extends StatefulWidget {
  CollectionDetailPageViewModel viewModel;

  CollectionDetailPage(
      {super.key,
      required CollectionDetailPageViewModel collectionDetailPageViewModel})
      : viewModel = collectionDetailPageViewModel;

  @override
  State<CollectionDetailPage> createState() => _CollectionDetailPageState();
}

class _CollectionDetailPageState extends State<CollectionDetailPage>
    with BaseView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: widget.viewModel.viewInitState(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return loadingView;
              case ConnectionState.done:
                if (snapshot.hasError || !snapshot.hasData) {
                  return ErrorView();
                }
                switch (snapshot.data) {
                  case CollectionDetailPageViewState.viewLoadedState:
                    return CollectionDetailPageContentView(
                        collection: widget.viewModel.getCollection(),
                        filteredPlacesByCategory:
                            widget.viewModel.filteredPlacesByCategory);
                  default:
                    return ErrorView();
                }
              default:
                return loadingView;
            }
          }),
    );
  }
}
