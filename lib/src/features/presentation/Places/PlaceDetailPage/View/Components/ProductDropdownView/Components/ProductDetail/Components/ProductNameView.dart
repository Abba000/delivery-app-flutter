// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

import '../../../../../../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../../../../../../../../Shared/commons_widgets/Texts/TextView/View/TextView.dart';

class ProductNameView extends StatelessWidget {
  PlaceProductEntity product;

  ProductNameView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      // Nombre del producto
      child: TextView(texto: product.productName, fontSize: 18),
    );
  }
}
