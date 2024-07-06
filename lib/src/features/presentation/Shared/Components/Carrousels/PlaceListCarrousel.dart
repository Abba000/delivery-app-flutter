// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../base/Views/BaseView.dart';
import '../../../../../utils/Helpers/ScreenSize/screen_size_helper.dart';
import '../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../../MainCordinator/MainCordinator.dart';
import '../../StateProviders/user_state_provider.dart';
import '../Cards/FavouritesCards/View/FavouritesCardView.dart';
import '../Cards/PlaceListCard/View/PlaceListCardView.dart';

enum PlaceListCarrouselStyle { list, listCards }

class PlaceListCarrousel extends StatelessWidget with BaseView {
  final List<PlaceDetailEntity> placeList;
  final bool isShortedVisualization;
  final PlaceListCarrouselStyle carrouselStyle;

  PlaceListCarrousel(
      {Key? key,
      required this.placeList,
      required this.isShortedVisualization,
      required this.carrouselStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int itemCount = placeList.length > 3 ? 3 : placeList.length;
    int dynamicHeight =
        isShortedVisualization ? 130 * itemCount : 210 * placeList.length;

    return Container(
        alignment: Alignment.topCenter,
        width: getScreenWidth(context: context),
        height: dynamicHeight.toDouble(),
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: isShortedVisualization ? itemCount : placeList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              switch (carrouselStyle) {
                case PlaceListCarrouselStyle.list:
                  return PlaceListCardView(
                      hasFreeDelivery: placeList[index].hasFreeDelivery,
                      placeListDetailEntity: placeList[index]);
                case PlaceListCarrouselStyle.listCards:
                  return FavouritesCardView(
                      isFavourite: placeList[index].isUserFavourite(
                          userUid: MainCoordinator.sharedInstance?.userUid),
                      placeListDetailEntity: placeList[index],
                      delegate: Provider.of<DefaultUserStateProvider>(context));
              }
            }));
  }
}
