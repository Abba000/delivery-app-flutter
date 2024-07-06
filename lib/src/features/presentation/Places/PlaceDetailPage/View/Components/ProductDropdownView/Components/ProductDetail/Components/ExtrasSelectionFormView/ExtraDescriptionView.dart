// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

import '../../../../../../../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../../../../../../../../../Shared/commons_widgets/Texts/TextView/View/TextView.dart';

class ExtraDescriptionView extends StatelessWidget {
  PlaceProductExtrasEntity extra;

  ExtraDescriptionView({super.key, required this.extra});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      // Texto elegido por el admin + nombre del producto
      child: TextView(
          texto: extra.title, fontSize: 16, fontWeight: FontWeight.w700),
    );
  }
}
