import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';

import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Alerts/alert_dialog.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/BackButtons/back_button.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Buttons/rounded_button.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Headers/header_text.dart';
import 'package:flutter_application_test/src/features/presentation/Auth/forgot_password_page/Model/ForgotPasswordModel.dart';
import 'package:flutter_application_test/src/features/presentation/Auth/forgot_password_page/View/components/TextFormFieldForgotPassword.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  //DEPENDENCIAS
  final ForgotPasswordViewModel _viewModel;

  ForgotPasswordState({ForgotPasswordViewModel? viewModel})
      : _viewModel = viewModel ?? DefaultForgotPasswordViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(
          builder: (BuildContext context) {
            return backButton(context, Colors.black);
          },
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              headerText(
                  texto: 'Forgot password',
                  color: primaryColor,
                  fontSize: 30.0),

              /*Text('Forgot password',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0))*/

              Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                    'Pleace enter your email address. You will receive a link to create a new password via email.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0)),
              ),
              TextFormFieldEmailUpdatePassword(viewModel: _viewModel),
              createElevatedButton(
                  color: naranja,
                  labelButton: 'Send',
                  shape: const StadiumBorder(),
                  func: () => ctaButtonTapet(context))
            ],
          ),
        ),
      ),
    );
  }
}

extension UserActions on ForgotPasswordState {
  void ctaButtonTapet(BuildContext context) {
    _viewModel.updatePassword().then((value) {
      showAlertDialog(
          context,
          const AssetImage('assets/images/lock.png'),
          'Your password has been reset',
          "You'll shortly receive an email with a code to setup a new password.",
          "Done",
          createElevatedButton(
              color: naranja,
              labelButton: 'Done',
              func: () {
                Navigator.pushNamed(context, 'login');
              }));
    });
  }
}
