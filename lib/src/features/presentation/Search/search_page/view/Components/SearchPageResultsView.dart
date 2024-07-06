// ignore_for_file: file_names, must_be_immutable, annotate_overrides

import 'package:flutter/material.dart';

import '../../../../../../base/Views/BaseView.dart';
import '../../../../../domain/Entities/Places/FiltersModelEntity.dart';
import '../../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../../../../FilterPage/View/FilterPage.dart';
import '../../../../Shared/Components/Carrousels/PlaceListCarrousel.dart';
import '../../../../Shared/commons_widgets/Texts/DoubleTextView/View/DoubleTextView.dart';

class SearchPageBuildResultsView extends StatefulWidget {
  // Dependencies
  List<PlaceDetailEntity> places = [];

  SearchPageBuildResultsView({Key? key, required this.places})
      : super(key: key);

  @override
  State<SearchPageBuildResultsView> createState() =>
      _SearchPageBuildResultsViewState();
}

class _SearchPageBuildResultsViewState extends State<SearchPageBuildResultsView>
    with BaseView, FilterPageDelegate {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  const DoubleTextView(
                      textHeader: 'Resultados', textAction: ''),
                  const SizedBox(height: 20.0),
                  PlaceListCarrousel(
                      placeList: widget.places,
                      isShortedVisualization: false,
                      carrouselStyle: PlaceListCarrouselStyle.list)
                ],
              ),
            )
          ]),
        )
      ],
    );
  }

  applyFilters({required FiltersModelEntity filters}) {
    setState(() {
      // widget.places = DefaultPlaceListUseCase.filterPlaceList(places: widget.places, filters: filters);
    });
  }
}
