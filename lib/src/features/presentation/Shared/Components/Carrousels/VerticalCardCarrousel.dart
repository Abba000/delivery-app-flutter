// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../Cards/VerticalCards/NoveltyPlacesVerticalCardView/NoveltyPlacesVerticalCardView.dart';

class VerticalCardCarrousel extends StatelessWidget {
  final List<PlaceDetailEntity> placeList;

  const VerticalCardCarrousel({Key? key, required this.placeList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 360.0,
        child: ListView.builder(
            itemCount: placeList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return NoveltyPlacesVerticalCardView(
                  placeListDetailEntity: placeList[index]);
            }));
  }
}
