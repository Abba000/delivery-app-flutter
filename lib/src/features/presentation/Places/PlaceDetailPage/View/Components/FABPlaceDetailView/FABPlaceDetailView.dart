// ignore_for_file: file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import '../../../../../../../Colors/colors.dart';
import '../../../../../Shared/commons_widgets/Texts/TextView/View/TextView.dart';

class FABRoundedRectangleView extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? backgroundColor;
  final bool isHidden;
  final ShapeBorder? shape;

  FABRoundedRectangleView(
      {Key? key,
      required this.text,
      this.backgroundColor = naranja,
      this.shape = const StadiumBorder(),
      required this.onPressed,
      required this.isHidden})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isHidden
        ? Container()
        : FloatingActionButton.extended(
            onPressed: onPressed,
            backgroundColor: backgroundColor,
            shape: shape,
            label: TextView(
                texto: text,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16));
  }
}
