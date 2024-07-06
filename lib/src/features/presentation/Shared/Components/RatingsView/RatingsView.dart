// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

import '../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../Cards/CardRatingView/CardRatingView.dart';

class RatingsView extends StatelessWidget {
  List<PlaceRatingEntity> placeRatings;

  RatingsView({Key? key, required this.placeRatings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: _getPlaceRatingsViews(),
        )
      ],
    );
  }

  List<Widget> _getPlaceRatingsViews() {
    return placeRatings
        .map((placeRating) => CardRatingView(placeRating: placeRating))
        .toList();
  }
}
