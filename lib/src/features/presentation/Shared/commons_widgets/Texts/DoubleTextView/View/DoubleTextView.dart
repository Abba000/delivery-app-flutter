// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';
import '../../TextView/View/TextView.dart';

class DoubleTextView extends StatelessWidget {
  final String textHeader;
  final String textAction;
  final Function()? textActionTapped;

  const DoubleTextView(
      {super.key,
      required this.textHeader,
      required this.textAction,
      this.textActionTapped});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextView(texto: textHeader, fontSize: 20.0),
        const Spacer(),
        GestureDetector(
          onTap: textActionTapped,
          child: TextView(
              texto: textAction,
              color: naranja,
              fontWeight: FontWeight.w500,
              fontSize: 15.0),
        )
      ],
    );
  }
}




/*
GestureDetector(
            onTap: textActionTapped,
            child: TextView(
                texto: textAction,
                color: orange,
                fontWeight: FontWeight.w500,
                fontSize: 15.0)
 */