// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import '../../../../../../../../../../../Colors/Colors.dart';
import '../../../../../../../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../../../../../../../../../Shared/commons_widgets/Texts/TextView/View/TextView.dart';

class ProductExtraMaxCountView extends StatelessWidget {
  PlaceProductExtrasEntity extra;

  ProductExtraMaxCountView({super.key, required this.extra});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16),
          // Elige + cantidad de elementos a elegir + producto
          child: TextView(
              texto: _getTitleText(),
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: gris),
        ),
        const SizedBox(width: 8),
        extra.isRequired
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 80,
                  height: 18,
                  color: naranja,
                  child: const Center(
                    child: TextView(
                        texto: 'Necesario',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12),
                  ),
                ))
            : Container(),
        const Spacer(),
      ],
    );
  }

  _getTitleText() {
    return extra.maxExtras > 1
        ? "Elige ${extra.maxExtras} productos -"
        : "Elige ${extra.maxExtras} producto -";
  }
}
