import 'package:flutter/material.dart';
//colors
import 'package:flutter_application_test/src/colors/colors.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Headers/header_text.dart';
//common widgets
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Headers/header_text_button.dart';
//custom wigets
import 'package:flutter_application_test/src/features/presentation/Filters/filter_page/view/custom_widgets/cuisines_filters.dart';
import 'package:flutter_application_test/src/features/presentation/Filters/filter_page/view/custom_widgets/list_tile_checked.dart';
import 'package:flutter_application_test/src/features/presentation/Filters/filter_page/view/custom_widgets/price_filters.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  //sort by booleans
  bool topRated = false;
  bool nearMe = false;
  bool costHighToLow = false;
  bool costLowToHigh = false;
  bool mostPopular = false;

  //filter booleans
  bool openNow = false;
  bool creditCards = false;
  bool alcoholServed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(context),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 15.0, left: 15.0),
                child: headerText(
                    texto: 'CUISINES',
                    color: gris,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: const CuisinesFilter()),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 15.0, left: 15.0),
                child: headerText(
                    texto: 'SORT BY',
                    color: gris,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0),
              ),
              _sortByContainer(),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 30.0, left: 15.0),
                child: headerText(
                    texto: 'FILTER',
                    color: gris,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0),
              ),
              _filterContainer(),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 30.0, left: 15.0),
                child: headerText(
                    texto: 'PRICE',
                    color: gris,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0),
              ),
              const PriceFilter()
            ]))
          ],
        ));
  }

  Widget _sortByContainer() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            ListTileCheck(
              texto: 'Top Rated',
              isActive: topRated,
              func: () {
                setState(() => topRated = !topRated);
              },
            ),
            ListTileCheck(
              texto: 'Nearest Me',
              isActive: nearMe,
              func: () {
                setState(() => nearMe = !nearMe);
              },
            ),
            ListTileCheck(
              texto: 'Cost High to Low',
              isActive: costHighToLow,
              func: () {
                setState(() => costHighToLow = !costHighToLow);
              },
            ),
            ListTileCheck(
              texto: 'Cost Low to High',
              isActive: costLowToHigh,
              func: () {
                setState(() => costLowToHigh = !costLowToHigh);
              },
            ),
            ListTileCheck(
              texto: 'Most Popular',
              isActive: mostPopular,
              func: () {
                setState(() => mostPopular = !mostPopular);
              },
            ),
          ],
        ));
  }

  Widget _filterContainer() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            ListTileCheck(
              texto: 'Open Now',
              isActive: openNow,
              func: () {
                setState(() => openNow = !openNow);
              },
            ),
            ListTileCheck(
              texto: 'Creadits Cards',
              isActive: creditCards,
              func: () {
                setState(() => creditCards = !creditCards);
              },
            ),
            ListTileCheck(
              texto: 'Alcohol Served',
              isActive: alcoholServed,
              func: () {
                setState(() => alcoholServed = !alcoholServed);
              },
            )
          ],
        ));
  }
}

PreferredSizeWidget? _appBar(BuildContext context) {
  return AppBar(
    elevation: 0.5,
    backgroundColor: Colors.white,
    title: Container(
        margin: const EdgeInsets.only(top: 12.0),
        alignment: Alignment.center,
        child: createText(texto: 'Filters', fontWeight: FontWeight.w600)),
    leading: Container(
        padding: const EdgeInsets.only(top: 20, left: 9.0),
        child: createText(
            texto: 'Reset', fontWeight: FontWeight.w500, fontSize: 17.0)),
    actions: [
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            padding: const EdgeInsets.only(top: 20, right: 10.0),
            child: createText(
                texto: 'Done',
                color: naranja,
                fontWeight: FontWeight.w500,
                fontSize: 17.0)),
      )
    ],
  );
}
