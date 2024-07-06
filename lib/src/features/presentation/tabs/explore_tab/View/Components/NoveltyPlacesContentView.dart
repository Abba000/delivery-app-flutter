// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

import '../../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../../../../Shared/Components/Carrousels/VerticalCardCarrousel.dart';
import '../../../../Shared/commons_widgets/Texts/TextView/View/TextView.dart';

class NoveltyPlacesContentView extends StatelessWidget {
  // Dependencies
  List<PlaceDetailEntity> noveltyPlaces = [];

  NoveltyPlacesContentView({Key? key, required this.noveltyPlaces})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return noveltyPlaces.isEmpty
        ? Container(height: 20)
        : Column(
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  alignment: Alignment.centerLeft,
                  child: const TextView(
                      texto: 'Discover new places',
                      color: Colors.black,
                      fontSize: 30.0)),
              VerticalCardCarrousel(placeList: noveltyPlaces)
            ],
          );
  }
}
