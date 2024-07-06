// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/MainCordinator/MainCordinator.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/LoadingStatusProvider.dart';
//UIS
import 'dart:ui';

import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Buttons/rounded_button.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Texts/TextView/View/TextView.dart';
import 'package:flutter_application_test/src/features/presentation/Auth/welcome_page/ViewModel/WelcomePageViewModel.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';
import 'package:provider/provider.dart';

import '../../../../../base/Views/BaseView.dart';
//CommonsWidgets

class WelcomePage extends StatefulWidget with BaseView {
  WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with BaseView {
  final WelcomePageViewModel viewModel;

  _WelcomePageState({WelcomePageViewModel? welcomePageViewModel})
      : viewModel = welcomePageViewModel ?? DefaultWelcomePageViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.initState(
        loadingState: Provider.of<LoadingStateProvider>(context));

    return viewModel.loadingStatusState.isLoading
        ? loadingView
        : Scaffold(
            body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1502301103665-0b95cc738daf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                )),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                  child: Container(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: const TextView(
                        texto: 'DELIVERED FAST FOOD\nTO YOUR\nDOOR',
                        color: Colors.white,
                        fontSize: 40.0),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 30.0),
                    child: const Text(
                        'Set exact location to find the right restaurants near you.',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 17.0)),
                  ),
                  createElevatedButton(
                      labelButton: 'Log in',
                      color: naranja,
                      shape: const StadiumBorder(),
                      func: () {
                        coordinator.showLoginPage(context: context);
                      }),
                  createElevatedButton(
                      labelButton: 'Connect with Google',
                      labelColor: Colors.black,
                      color: white,
                      isWithIcon: true,
                      shape: const StadiumBorder(),
                      icon: const AssetImage('assets/google.png'),
                      func: () {
                        googleSignInTapped(context);
                      })
                ],
              )
            ],
          ));
  }
}

extension UserActions on _WelcomePageState {
  googleSignInTapped(BuildContext context) {
    viewModel.signInWithGoogle().then((result) {
      switch (result.status) {
        case ResultStatus.success:
          coordinator.showTabsPage(context: context);
          break;
        case ResultStatus.error:
          errorStateProvider.setFailure(context: context, value: result.error!);
          break;
      }
    });
  }
}
