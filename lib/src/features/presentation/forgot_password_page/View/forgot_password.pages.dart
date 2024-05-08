import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';

import 'package:flutter_application_test/src/features/presentation/commons_widgets/Alerts/alert_dialog.dart';
import 'package:flutter_application_test/src/features/presentation/commons_widgets/BackButtons/back_button.dart';
import 'package:flutter_application_test/src/features/presentation/commons_widgets/Buttons/rounded_button.dart';
import 'package:flutter_application_test/src/features/presentation/commons_widgets/Headers/header_text.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(builder: (BuildContext context) {
          return backButton(context, Colors.black);
        }),
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            headerText(
                texto: 'Forgot password', color: primaryColor, fontSize: 30.0),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'Please enter your wmail address. You will receive a link to create a new password via email',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0),
              ),
            ),
            _emailInput(),
            createElevatedButton(
                labelButton: 'Send',
                shape: const StadiumBorder(),
                color: naranja,
                func: () => _showAlerta(context))
          ],
        ),
      )),
    );
  }
}

Widget _emailInput() {
  return Container(
    margin: const EdgeInsets.only(top: 40.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(142, 142, 147, 1.2),
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Your email',
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          )),
    ),
  );
}

void _showAlerta(BuildContext context) {
  showAlertDialog(
      context,
      const AssetImage('assets/lock.png'),
      'Your password has been reset',
      "You'll shortly receive an email with a code to setup a new password.",
      createElevatedButton(
          labelButton: 'Done',
          color: naranja,
          shape: const StadiumBorder(),
          func: () {
            Navigator.pushNamed(context, 'login');
          }));
}
