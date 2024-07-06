// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

import '../../../../../../../../../../utils/Helpers/ScreenSize/screen_size_helper.dart';
import '../../../../../../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';

class TopBarView extends StatelessWidget {
  PlaceProductEntity product;

  TopBarView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
            width: double.infinity,
            height: getScreenHeight(context: context, multiplier: 0.42),
            fit: BoxFit.fill,
            image: NetworkImage(product.imgs.first)),
        Container(
          margin: const EdgeInsets.only(top: 56, left: 4),
          child: Row(
            children: [
              IconButton(
                iconSize: 28,
                icon: const Icon(Icons.cancel, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const Spacer(),
            ],
          ),
        )
      ],
    );
  }
}
