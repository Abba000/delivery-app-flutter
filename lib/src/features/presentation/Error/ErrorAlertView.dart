// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/base/Views/BaseView.dart';
import 'package:flutter_application_test/src/colors/colors.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/MainCordinator/MainCordinator.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Buttons/rounded_button.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Texts/TextView/View/TextView.dart';
import 'package:flutter_application_test/src/utils/Helpers/ScreenSize/screen_size_helper.dart';

class ErrorView extends StatelessWidget with BaseView {
  bool isLocationDeniedError = false;
  String assetImagePath = "";
  String errorTitle = "";
  String errorSubTitle = "";

  ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setErrorViewData();
    return Scaffold(
      backgroundColor: bgGray,
      body: Center(
        child: Container(
          padding: EdgeInsets.only(
              top: getScreenHeight(context: context, multiplier: 0.1),
              bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(width: 216, height: 216, image: AssetImage(assetImagePath)),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: TextView(
                    texto: errorTitle,
                    color: gris,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextView(
                    texto: errorSubTitle,
                    textAlign: TextAlign.center,
                    color: gris,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              createElevatedButton(
                  context: context,
                  width: 300,
                  func: () {
                    if (isLocationDeniedError) {
                    } else {
                      coordinator.showTabsPage(context: context);
                    }
                  },
                  color: naranja,
                  labelButton: isLocationDeniedError
                      ? "Establecer dirección de entrega"
                      : "Ir a Inicio",
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)))
            ],
          ),
        ),
      ),
    );
  }

  setErrorViewData() {
    assetImagePath =
        isLocationDeniedError ? 'assets/location.png' : 'assets/errorIcon.png';
    errorTitle =
        isLocationDeniedError ? 'Location Denied Error' : 'Network Error';
    errorSubTitle = isLocationDeniedError
        ? 'Something bad happened, Without your current location, the app cannot continue to work properly. \n\n You can order anything, just indicate in which direction'
        : 'Something bad happened, the app cannot continue to work properly.';
  }
}
