// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/features/presentation/Places/PlaceDetailPage/View/Components/ProductDropdownView/Components/ProductDetail/Components/ExtrasSelectionFormView/ExtraDescriptionView.dart';
import 'package:flutter_application_test/src/features/presentation/Places/PlaceDetailPage/View/Components/ProductDropdownView/Components/ProductDetail/Components/ExtrasSelectionFormView/ExtrasListView.dart';
import 'package:flutter_application_test/src/features/presentation/Places/PlaceDetailPage/View/Components/ProductDropdownView/Components/ProductDetail/Components/ExtrasSelectionFormView/ProductExtrasMaxCountView.dart';

import '../../../../../../../../../../domain/Entities/Order/OrderEntity.dart';
import '../../../../../../../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../../../../../../../ViewModel/PlaceDetailViewModel.dart';

mixin ExtraSelectionFormViewDelegate {
  updateProductForOrder({required ProductOrderEntity product});
}

class OptionsSelectionFormView extends StatelessWidget {
  PlaceDetailViewModel viewModel;
  ProductOrderEntity product;
  PlaceProductExtrasEntity extra;
  ExtraSelectionFormViewDelegate delegate;

  OptionsSelectionFormView(
      {Key? key,
      required this.extra,
      required this.viewModel,
      required this.product,
      required this.delegate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExtraDescriptionView(extra: extra),
        const SizedBox(height: 8),
        ProductExtraMaxCountView(extra: extra),
        const SizedBox(height: 16),
        ExtrasListView(
            viewModel: viewModel,
            extra: extra,
            product: product,
            delegate: delegate)
      ],
    );
  }
}
