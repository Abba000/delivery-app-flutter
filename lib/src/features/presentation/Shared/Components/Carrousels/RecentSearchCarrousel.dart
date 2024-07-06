// ignore_for_file: prefer_const_constructors_in_immutables, file_names
import 'package:flutter/material.dart';

import '../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../Cards/VerticalCards/RecentSearchVerticalCardView/RecentSearchVerticalCardView.dart';

class RecentSearchCarrouselView extends StatelessWidget {
  // Dependencies
  final List<PlaceDetailEntity> placeList;
  RecentSearchCarrouselView({Key? key, required this.placeList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 5.0),
        height: 240.0,
        child: ListView.builder(
          itemCount: placeList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return RecentSearchVerticalCardView(
                placeListDetailEntity: placeList[index]);
          },
        ));
  }
}
