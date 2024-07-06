// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/MainCordinator/MainCordinator.dart';

import '../../../../../../base/Views/BaseView.dart';
import '../../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../../../../Shared/Components/Carrousels/PlaceListCarrousel.dart';
import '../../../../Shared/Components/Headers/HeaderView.dart';

class PopularPlacesContentView extends StatelessWidget with BaseView {
  List<PlaceDetailEntity> popularPlaces = [];
  PopularPlacesContentView({Key? key, required this.popularPlaces})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return popularPlaces.isEmpty
        ? Container(height: 20)
        : Column(
            children: [
              GestureDetector(
                  onTap: () => coordinator.showPlaceListPage(
                      context: context, popularPlaces: popularPlaces),
                  child: HeaderView(
                      textHeader: "Popular this week", textAction: "Show all")),
              const SizedBox(
                height: 15.0,
              ),
              PlaceListCarrousel(
                  placeList: popularPlaces,
                  isShortedVisualization: true,
                  carrouselStyle: PlaceListCarrouselStyle.list)
            ],
          );
  }
}
