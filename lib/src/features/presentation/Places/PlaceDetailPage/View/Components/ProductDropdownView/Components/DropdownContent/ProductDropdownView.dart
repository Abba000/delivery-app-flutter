// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/features/presentation/Places/PlaceDetailPage/View/Components/ProductDropdownView/Components/DropdownContent/ProductDropdownContentView.dart';

import '../../../../../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../../../../../../../Shared/Components/Texts/DoubleTextView/View/DoubleTextDropdownView.dart';
import '../../../../../ViewModel/PlaceDetailViewModel.dart';

class ProductDropdownView extends StatefulWidget {
  final PlaceCategoryEntity category;
  PlaceDetailViewModel viewModel;
  bool isExpanded = true;

  ProductDropdownView(
      {Key? key, required this.category, required this.viewModel});

  @override
  State<ProductDropdownView> createState() => _ProductDropdownViewState();
}

class _ProductDropdownViewState extends State<ProductDropdownView>
    with DoubleTextDropdownViewDelegate {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DoubleTextDropdownView(
        header: widget.category.categoryName,
        delegate: this,
        isExpanded: widget.isExpanded,
        dropdownRightText: "${widget.category.products.length}",
      ),
      widget.isExpanded
          ? Transform.translate(
              offset: const Offset(0, -20),
              child: ProductDropdownContentView(
                  viewModel: widget.viewModel,
                  products: widget.category.products))
          : Container(),
    ]);
  }

  @override
  dropDownTapped({required bool isExpanded}) {
    setState(() {
      widget.isExpanded = isExpanded;
    });
  }
}
