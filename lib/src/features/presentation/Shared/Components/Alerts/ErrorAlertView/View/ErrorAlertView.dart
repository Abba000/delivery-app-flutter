// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../../../../../colors/colors.dart';
import '../../../Buttons/RoundedButton/View/RoundedButton.dart';
import '../../../Texts/TextView/View/TextView.dart';

class ErrorAlertView {
  static Future showErrorAlertDialog(
      {required BuildContext context,
      required String subTitle,
      dynamic Function()? ctaButtonAction}) async {
    await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: SizedBox(
              height: 320,
              child: Column(
                children: [
                  const Image(
                    image: AssetImage('assets/errorIcon.png'),
                    width: 130,
                    height: 130,
                  ),
                  Container(
                      margin: const EdgeInsets.all(15.0),
                      child: const TextView(
                          texto: "Network error",
                          color: primaryColor,
                          fontSize: 20.0)),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Text(subTitle,
                        style: const TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0)),
                  ),
                  createElevatedButton(
                      color: naranja,
                      labelButton: 'Ir a Inicio',
                      shape: const StadiumBorder(),
                      func: ctaButtonAction)
                ],
              ),
            ),
          );
        });
  }
}
