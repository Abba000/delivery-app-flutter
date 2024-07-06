// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../../../Colors/Colors.dart';
import '../BackButtons/BackButtonView/View/BackButtonView.dart';

PreferredSizeWidget? createAppBarDone(
    {required String title,
    required String actionText,
    required Function()? onTap}) {
  return AppBar(
    title:
        Text(title, style: const TextStyle(fontSize: 17, color: Colors.black)),
    backgroundColor: white,
    elevation: 0.4,
    leading: Builder(
      builder: (BuildContext context) {
        return const BackButtonView(color: Colors.black);
      },
    ),
    actions: [
      GestureDetector(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.only(top: 20, right: 15.0),
            child: Text(actionText,
                style: const TextStyle(
                    color: naranja,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500))),
      )
    ],
  );
}

// updateUserData();