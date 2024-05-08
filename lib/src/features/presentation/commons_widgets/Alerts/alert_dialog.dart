import 'package:flutter/material.dart';
//Header Text
import 'package:flutter_application_test/src/features/presentation/commons_widgets/Headers/header_text.dart';
//colors
import 'package:flutter_application_test/src/colors/colors.dart';

void showAlertDialog(BuildContext context, ImageProvider<Object> imagePath,
    String headerTitle, String headerSubtitle, Widget doneButton) async {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: SizedBox(
            height: 330,
            child: Column(
              children: [
                Image(
                  image: imagePath,
                  width: 130,
                  height: 130,
                ),
                Container(
                    margin: const EdgeInsets.all(15.0),
                    child: headerText(
                        texto: headerTitle,
                        color: primaryColor,
                        fontSize: 20.0)),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  child: Text(
                    headerSubtitle,
                    style: const TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0),
                  ),
                ),
                doneButton
              ],
            ),
          ),
        );
      });
}
