// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/MainCordinator/MainCordinator.dart';

import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Buttons/rounded_button.dart';
import 'package:flutter_application_test/src/features/presentation/Auth/forgot_password_page/View/components/TextFormFieldForgotPassword.dart';

import '../../../../../base/Views/BaseView.dart';
import '../../../Shared/Components/Alerts/AlertView/Model/AlertViewModel.dart';
import '../../../Shared/Components/Alerts/AlertView/View/AlertView.dart';
import '../../../Shared/Components/BackButtons/BackButtonView/View/BackButtonView.dart';
import '../../../Shared/Components/Texts/TextView/View/TextView.dart';
import '../ViewModel/ForgotPasswordViewModel.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({super.key});

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> with BaseView {
  // Dependencies
  final UpdatePasswordViewModel _viewModel;

  _UpdatePasswordPageState({UpdatePasswordViewModel? updatePasswordViewModel})
      : _viewModel =
            updatePasswordViewModel ?? DefaultUpdatePasswordViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(builder: (BuildContext context) {
          return const BackButtonView(color: Colors.black);
        }),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const TextView(
                  texto: 'Forgot password',
                  color: primaryColor,
                  fontSize: 30.0),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                    'Please enter your email address. You will receive a link to create a new password via email.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0)),
              ),
              TextFormFieldEmailUpdatePassword(viewModel: _viewModel),
              createElevatedButton(
                  labelButton: 'Send',
                  shape: const StadiumBorder(),
                  color: naranja,
                  func: () => _ctaButtonTapped(context))
            ],
          ),
        ),
      ),
    );
  }
}

extension UserActions on _UpdatePasswordPageState {
  void _ctaButtonTapped(BuildContext context) {
    _viewModel.updatePassword(email: _viewModel.email).then((value) {
      AlertView.showAlertDialog(
          model: AlertViewModel(
              context,
              const AssetImage('assets/lock.png'),
              'Your password has been reset',
              "You'll shortly receive an email with a code to setup a new password.",
              'Done',
              null, () {
        coordinator.showLoginPage(context: context);
      }, null));
    });
  }
}
