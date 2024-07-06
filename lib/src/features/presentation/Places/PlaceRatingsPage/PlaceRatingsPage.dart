// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import '../../../../Colors/colors.dart';
import '../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../../Shared/Components/BackButtons/BackButtonView/View/BackButtonView.dart';
import '../../Shared/Components/RatingsView/RatingsView.dart';
import '../../Shared/commons_widgets/Texts/TextView/View/TextView.dart';

class PlaceRatingsPage extends StatelessWidget {
  List<PlaceRatingEntity> placeRatings;

  PlaceRatingsPage({Key? key, required this.placeRatings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        leading: Builder(
          builder: (BuildContext context) {
            return const BackButtonView(color: Colors.black);
          },
        ),
        backgroundColor: white,
        title: const TextView(
            texto: 'Ratings',
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RatingsView(placeRatings: placeRatings)),
    );
  }
}
