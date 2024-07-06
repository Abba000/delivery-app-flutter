// ignore_for_file: file_names, must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';

import '../../../Shared/Components/Buttons/RoundedButton/View/RoundedButton.dart';
import '../../ViewModel/FilterPageViewModel.dart';

class CuisinesFilter extends StatefulWidget {
  FilterPageViewModel viewModel;

  CuisinesFilter({Key? key, required this.viewModel}) : super(key: key);
  @override
  _CuisinesFilterState createState() => _CuisinesFilterState();
}

class _CuisinesFilterState extends State<CuisinesFilter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          children: createCollectionsButtons(),
        )
      ],
    );
  }

  List<Widget> createCollectionsButtons() {
    List<Widget> childrens = [];
    for (var collection in widget.viewModel.collections) {
      childrens.add(_roundedButtonFilter(() {
        setState(() {
          widget.viewModel.filtersModel.collectionSelected = collection;
        });
      }, widget.viewModel.filtersModel.collectionSelected == collection,
          collection.name));
    }
    return childrens;
  }

  Widget _roundedButtonFilter(
      Function()? func, bool isActive, String labelText) {
    return Container(
      width: 160,
      height: 55,
      margin: const EdgeInsets.only(left: 5),
      child: createElevatedButton(
        labelButton: labelText,
        labelColor: isActive ? naranja : gris,
        func: func,
        color: white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color: isActive ? naranja : gris)),
      ),
    );
  }
}
