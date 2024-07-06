import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';
//commons widgets
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Headers/header_text.dart';

Widget headerDoubleText(
    {required String textHeader,
    required String textAction,
    Function()? func}) {
  return Row(
    children: [
      headerText(texto: textHeader, fontSize: 20.0),
      const Spacer(),
      GestureDetector(
        onTap: func,
        child: headerText(
            texto: textAction,
            color: naranja,
            fontWeight: FontWeight.w500,
            fontSize: 15.0),
      )
    ],
  );
}
