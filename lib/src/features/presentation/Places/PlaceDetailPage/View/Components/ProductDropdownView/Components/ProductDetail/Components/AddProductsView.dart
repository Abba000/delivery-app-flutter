// ignore_for_file: file_names, must_be_immutable, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import '../../../../../../../../../../Colors/Colors.dart';
import '../../../../../../../../Shared/commons_widgets/Texts/TextView/View/TextView.dart';

mixin AddProductsViewDelegate {
  addAmount();
  subtractAmount();
}

class AddProductsView extends StatelessWidget {
  AddProductsViewDelegate delegate;
  int amount;

  AddProductsView({super.key, required this.delegate, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Spacer(),
        IconButton(
            icon: const Icon(
              Icons.do_not_disturb_on,
              color: gris,
              size: 32,
            ),
            onPressed: () {
              delegate.subtractAmount();
            }),
        const SizedBox(width: 8),
        TextView(texto: "${amount}", fontSize: 18),
        const SizedBox(width: 8),
        IconButton(
            icon: const Icon(
              Icons.add_circle,
              color: naranja,
              size: 32,
            ),
            onPressed: () {
              delegate.addAmount();
            }),
        const Spacer()
      ],
    );
  }
}
