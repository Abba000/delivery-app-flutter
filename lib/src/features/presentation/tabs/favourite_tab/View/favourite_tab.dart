// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';
import 'package:provider/provider.dart';
import '../../../../../base/Views/BaseView.dart';
import '../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../../../Error/ErrorAlertView.dart';
import '../../../Shared/StateProviders/user_state_provider.dart';
import 'Components/FavouriteTabContentView.dart';

class FavouriteTab extends StatefulWidget {
  const FavouriteTab({Key? key}) : super(key: key);

  @override
  _FavouriteTabState createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab>
    with BaseView, FavouritePageChangeStateDelegate {
  @override
  Widget build(BuildContext context) {
    Provider.of<DefaultUserStateProvider>(context)
        .favouritePageChangeStateDelegate = this;

    return Scaffold(
        backgroundColor: bgGray,
        body: FutureBuilder(
            future: Provider.of<DefaultUserStateProvider>(context)
                .fetchUserFavouritePlaces(),
            builder: (BuildContext context,
                AsyncSnapshot<List<PlaceDetailEntity>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return loadingView;
                case ConnectionState.done:
                  if (snapshot.hasError || !snapshot.hasData) {
                    return ErrorView();
                  }
                  if (snapshot.hasData) {
                    return FavouriteTabContentView(
                        placeList: snapshot.data ?? []);
                  } else {
                    return Container();
                  }
                default:
                  return loadingView;
              }
            }));
  }

  @override
  placeFromFavouritesRemoved() {
    setState(() {});
  }
}
