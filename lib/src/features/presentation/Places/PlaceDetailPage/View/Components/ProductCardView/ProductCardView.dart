// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import '../../../../../../../utils/Helpers/ScreenSize/screen_size_helper.dart';
import '../../../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../../../ViewModel/PlaceDetailViewModel.dart';
import '../ProductDropdownView/Components/DropdownContent/RowsViews/ProductSelectedRowView.dart';
import '../ProductDropdownView/Components/DropdownContent/RowsViews/ProductUnSelectedRowView.dart';

class ProductCardView extends StatelessWidget {
  bool isSelected;
  PlaceProductEntity product;
  PlaceDetailViewModel viewModel;

  ProductCardView(
      {Key? key,
      required this.product,
      required this.isSelected,
      required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image(
              width: getScreenWidth(context: context),
              height: 50.0,
              fit: BoxFit.cover,
              image: NetworkImage(product.imgs.first)),
        ),
        isSelected
            ? ProductSelectedRowView(viewModel: viewModel, product: product)
            : ProductUnSelectedRowView(viewModel: viewModel, product: product),
        Divider(color: Colors.black.withOpacity(0.5))
      ],
    );
  }
}
