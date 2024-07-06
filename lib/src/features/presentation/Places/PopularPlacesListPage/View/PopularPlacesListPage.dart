// ignore_for_file: must_be_immutable, file_names, override_on_non_overriding_member

import 'package:flutter/material.dart';

import '../../../../../base/Views/BaseView.dart';
import '../../../../domain/Entities/Places/FiltersModelEntity.dart';
import '../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../../../FilterPage/View/FilterPage.dart';
import '../../../Shared/Components/BackButtons/BackButtonView/View/BackButtonView.dart';
import '../../../Shared/Components/Carrousels/PlaceListCarrousel.dart';

class PopularPlacesListPage extends StatefulWidget {
  List<PlaceDetailEntity> popularPlaces = [];
  PopularPlacesListPage({Key? key, required this.popularPlaces})
      : super(key: key);

  @override
  State<PopularPlacesListPage> createState() => _PopularPlacesListPageState();
}

class _PopularPlacesListPageState extends State<PopularPlacesListPage>
    with BaseView, FilterPageDelegate {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.4,
          leading: Builder(
            builder: (BuildContext context) {
              return const BackButtonView(color: Colors.black);
            },
          )),
      body: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  PlaceListCarrousel(
                      placeList: widget.popularPlaces,
                      isShortedVisualization: false,
                      carrouselStyle: PlaceListCarrouselStyle.list)
                ]),
              )
            ],
          )),
    );
  }

  @override
  applyFilters({required FiltersModelEntity filters}) {
    setState(() {
      // widget.popularPlaces = DefaultPlaceListUseCase.filterPlaceList(places: widget.popularPlaces, filters: filters);
    });
  }
}
// TODO: Para cuando vayamos a meter feature de filtros
/*
actions: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              child: IconButton(
                  icon: const Icon(
                    Icons.filter_list,
                    size: 36,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    coordinator.showFiltersPage(context: context, delegate: this);
                  }),
            )
          ],
 */