// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../../../../../colors/colors.dart';
import '../../../../../../../utils/Helpers/ScreenSize/screen_size_helper.dart';
import '../../../Buttons/RoundedButton/View/RoundedButton.dart';
import '../../../Texts/TextView/View/TextView.dart';
import '../Model/AlertViewModel.dart';

class AlertView {
  static Future showAlertDialog({required AlertViewModel model}) async {
    await showDialog(
        context: model.context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: SizedBox(
              height: getScreenHeight(context: context, multiplier: 0.4),
              child: Column(
                children: [
                  Image(
                    image: model.imagePath,
                    width: 130,
                    height: 130,
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: TextView(
                          texto: model.headerTitle,
                          color: primaryColor,
                          fontSize: 18.0)),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Text(model.headerSubTitle,
                        style: const TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0)),
                  ),
                  createElevatedButton(
                      color: naranja,
                      labelButton: model.ctaButtonText,
                      shape: const StadiumBorder(),
                      labelFontSize: 17,
                      func: model.ctaButtonAction),
                  const SizedBox(height: 15),
                  GestureDetector(
                      onTap: model.cancelTextAction,
                      child: TextView(
                          texto: model.cancelText ?? "",
                          color: gris,
                          fontSize: 17,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w300))
                ],
              ),
            ),
          );
        });
  }

  static closeAlertDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
