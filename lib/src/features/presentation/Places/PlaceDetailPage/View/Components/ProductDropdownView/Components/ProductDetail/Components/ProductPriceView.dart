// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

import '../../../../../../../../../../utils/Helpers/Checkout/CheckoutHelper.dart';
import '../../../../../../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../../../../../../../../Shared/commons_widgets/Texts/TextView/View/TextView.dart';

class ProductPriceView extends StatelessWidget {
  PlaceProductEntity product;

  ProductPriceView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      // Precio del producto
      child: TextView(
          texto: CheckoutHelper.formatPriceInEuros(product.productPrice),
          fontSize: 18,
          fontWeight: FontWeight.w500),
    );
  }
}
