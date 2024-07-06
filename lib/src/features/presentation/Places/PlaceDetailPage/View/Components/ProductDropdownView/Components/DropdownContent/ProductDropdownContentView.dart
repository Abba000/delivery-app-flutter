// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import '../../../../../../../../../utils/Helpers/ScreenSize/screen_size_helper.dart';
import '../../../../../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../../../../../ViewModel/PlaceDetailViewModel.dart';
import '../../../ProductCardView/ProductCardView.dart';

class ProductDropdownContentView extends StatefulWidget {
  PlaceDetailViewModel viewModel;
  List<PlaceProductEntity> products;

  ProductDropdownContentView(
      {Key? key, required this.viewModel, required this.products})
      : super(key: key);

  @override
  State<ProductDropdownContentView> createState() =>
      _ProductDropdownContentViewState();
}

class _ProductDropdownContentViewState
    extends State<ProductDropdownContentView> {
  bool isItemInOrderList = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 16),
        child: SizedBox(
          width: getScreenWidth(context: context),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _getProductCardsViews()),
        ));
  }

  List<Widget> _getProductCardsViews() {
    return widget.products.map((product) {
      return ProductCardView(
          isSelected: widget.viewModel.isProductInOrder(productId: product.id),
          product: product,
          viewModel: widget.viewModel);
    }).toList();
  }
}
