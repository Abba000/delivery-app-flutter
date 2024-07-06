// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../../../../../../utils/Helpers/ScreenSize/screen_size_helper.dart';
import '../../../../../../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';

class ProductDescriptionView extends StatelessWidget {
  PlaceProductEntity product;

  ProductDescriptionView({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: getScreenWidth(context: context, multiplier: 0.79),
      child: Text(
        product.productDescription,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
      ),
    );
  }
}
