// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/MainCordinator/MainCordinator.dart';
import '../../../../../../../base/Views/BaseView.dart';
import '../../../../../../../colors/colors.dart';
import '../../../../../../../utils/Helpers/DefaultImages/DefaultCardImageUrl.dart';
import '../../../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';

abstract class PlaceListCardViewDelegate {
  placeCardTapped({required PlaceDetailEntity placeListDetailEntity});
}

class PlaceListCardView extends StatelessWidget with BaseView {
  final bool hasFreeDelivery;
  final PlaceDetailEntity placeListDetailEntity;

  PlaceListCardView(
      {required this.hasFreeDelivery, required this.placeListDetailEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          coordinator.showPlaceDetailPage(
              context: context, place: placeListDetailEntity);
        },
        child: Column(
          children: [
            SizedBox(
              height: 130,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LeftImagePlaceListCardView(
                      imageUrl: placeListDetailEntity.imgs?.first ??
                          DefaultCardImageUrlHelper.defaultCardImageUrl),
                  RightContentPlaceListCardView(
                      hasFreeDelivery: hasFreeDelivery,
                      placeListDetailEntity: placeListDetailEntity)
                ],
              ),
            )
          ],
        ));
  }
}

class LeftImagePlaceListCardView extends StatelessWidget {
  final String imageUrl;
  const LeftImagePlaceListCardView({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image(
          width: 80.0,
          height: 80.0,
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl)),
    );
  }
}

class RightContentPlaceListCardView extends StatelessWidget {
  final bool hasFreeDelivery;
  final PlaceDetailEntity placeListDetailEntity;

  RightContentPlaceListCardView(
      {required this.hasFreeDelivery, required this.placeListDetailEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 6),
        height: 125,
        child: Column(
          children: [
            SizedBox(
              width: 280,
              child: Text(placeListDetailEntity.placeName,
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              width: 280,
              alignment: Alignment.centerLeft,
              child: Text(placeListDetailEntity.address,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: gris,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0)),
            ),
            Container(
              width: 280,
              margin: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.star, color: amarillo, size: 16.0),
                  Text("${placeListDetailEntity.ratingAverage}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0)),
                  const SizedBox(width: 5),
                  Text("(${placeListDetailEntity.ratings} ratings)",
                      style: const TextStyle(
                          color: gris,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0))
                ],
              ),
            )
          ],
        ));
  }
}
