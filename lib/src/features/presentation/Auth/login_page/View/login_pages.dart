// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
//ui
import 'package:flutter/services.dart';
import 'package:flutter_application_test/src/base/Views/BaseView.dart';
//colors
import 'package:flutter_application_test/src/colors/colors.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/MainCordinator/MainCordinator.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/LoadingStatusProvider.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Buttons/rounded_button.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/TextFormFields/CustomTextFormField.dart';
//widgets
import 'package:flutter_application_test/src/features/presentation/Auth/login_page/ViewModel/LoginViewModel.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget with BaseView {
  // * Dependencies
  final LoginViewModel _viewModel;

  LoginPage({super.key, LoginViewModel? viewModel})
      : _viewModel = viewModel ?? DefaultLoginViewModel();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.white));

    // * Inicializamos el ViewModel
    _viewModel.initState(
        loadingState: Provider.of<LoadingStateProvider>(context));

    return _viewModel.loadingStatusState.isLoading
        ? loadingView
        : Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  Column(
                    children: [
                      const Stack(
                        children: [
                          Image(
                              width: double.infinity,
                              height: 350.0,
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'))
                        ],
                      ),
                      Transform.translate(
                        offset: const Offset(0.0, -20.0),
                        child: Container(
                          width: double.infinity,
                          height: 500,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: Form(
                                key: _viewModel.formKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: Column(
                                  children: [
                                    const Text("Welcome Back",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30.0)),
                                    const Text("Login to you account",
                                        style: TextStyle(
                                            color: gris,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.0)),
                                    CustomTextFormField(
                                        delegate: _viewModel,
                                        textFormFieldType:
                                            CustomTextFormFieldType.email,
                                        hintext: 'Email'),
                                    CustomTextFormField(
                                        delegate: _viewModel,
                                        textFormFieldType:
                                            CustomTextFormFieldType.password,
                                        hintext: 'Password'),
                                    createElevatedButton(
                                        color: naranja,
                                        labelButton: 'Log in',
                                        shape: const StadiumBorder(),
                                        func: () {
                                          ctaTapped(context);
                                        }),
                                    Container(
                                      margin: const EdgeInsets.only(top: 30.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          //coordinator.showUpdatePasswordPage(context: context);
                                        },
                                        child: const Text(
                                            'Forgot you password?',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 17.0)),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 30.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text("Don't have an account?",
                                              style: TextStyle(
                                                  color: gris,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.0)),
                                          GestureDetector(
                                            onTap: () {
                                              //coordinator.showSignUpPage(context: context);
                                            },
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                              child: const Text('Sign up',
                                                  style: TextStyle(
                                                      color: naranja,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 15.0)),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ]))
              ],
            ),
          );
  }
}

// Auth Actions
extension UserActions on LoginPage {
  ctaTapped(BuildContext context) {
    if (_viewModel.isFormValidate()) {
      _viewModel
          .login(
              email: _viewModel.loginModel?.email ?? '',
              password: _viewModel.loginModel?.password ?? '')
          .then((result) {
        switch (result.status) {
          case ResultStatus.success:
            coordinator.showTabsPage(context: context);
            break;
          case ResultStatus.error:
            errorStateProvider.setFailure(
                context: context, value: result.error!);
            break;
        }
      });
    }
  }
}
