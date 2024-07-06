import 'package:flutter/material.dart';
//Header Text
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Headers/header_text.dart';
//colors
import 'package:flutter_application_test/src/colors/colors.dart';

void showAlertDialog(
  BuildContext context,
  ImageProvider<Object> imagePath,
  String headerTitle,
  String headerSubTitle,
  String labelButton,
  Widget doneButton,
) async {
  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white, // Establecer el fondo blanco aquí
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SizedBox(
          height: 350,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: imagePath,
                width: 130,
                height: 130,
              ),
              Container(
                  padding: const EdgeInsets.all(10.0),
                  child: headerText(
                      texto: headerTitle, color: naranja, fontSize: 20.0)),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  headerSubTitle,
                  style: const TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                  ),
                ),
              ),
              doneButton
            ],
          ),
        ),
      );
    },
  );
}
