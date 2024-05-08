// ignore_for_file: file_names

import 'package:flutter/material.dart';

// Constants
const _defectBorderRadius = BorderRadius.all(Radius.circular(20));
const _defectBoxShadowObject = [
  BoxShadow(
      color: Color.fromRGBO(210, 211, 215, 1.0),
      offset: Offset(0, 5),
      blurRadius: 10.0)
];

BoxDecoration getBoxDecorationWithShadows(
    {BorderRadiusGeometry borderRadius = _defectBorderRadius,
    Color containerColor = Colors.white,
    List<BoxShadow> boxShadows = _defectBoxShadowObject}) {
  return BoxDecoration(
      borderRadius: borderRadius, color: containerColor, boxShadow: boxShadows);
}
