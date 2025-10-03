// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import '../../../../../../Colors/colors.dart';
import '../../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../../../../Shared/Components/Carrousels/PlaceListCarrousel.dart';
import '../../../../Shared/Components/Texts/TextView/View/TextView.dart';

class FavouriteTabContentView extends StatelessWidget {
  List<PlaceDetailEntity> placeList;

  FavouriteTabContentView({Key? key, required this.placeList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: bgGray,
          centerTitle: true,
          title: TextView(
            texto: 'My Favourites',
            color: const ColorScheme.dark().secondary,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Transform.translate(
            offset: const Offset(0, -40),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PlaceListCarrousel(
                  placeList: placeList,
                  isShortedVisualization: false,
                  carrouselStyle: PlaceListCarrouselStyle.listCards),
            ),
          )
        ]))
      ],
    );
  }
}
