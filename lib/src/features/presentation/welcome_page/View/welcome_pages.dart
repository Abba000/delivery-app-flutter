import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';
//UIS
import 'dart:ui';

import 'package:flutter_application_test/src/features/presentation/commons_widgets/Headers/header_text.dart';
import 'package:flutter_application_test/src/features/presentation/commons_widgets/Buttons/rounded_button.dart';
//CommonsWidgets

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1502301103665-0b95cc738daf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: headerText(
                  texto: 'DELIVERED FAST FOOD TO YOUR DOOR',
                  color: Colors.white,
                  fontSize: 45.0),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
              child: const Text(
                  'Set exact location to find the right restaurants near you.',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.0)),
            ),
            createElevatedButton(
                labelButton: 'Log in',
                color: naranja,
                shape: const StadiumBorder(),
                func: () {
                  Navigator.pushNamed(context, 'login');
                }),
            createElevatedButton(
                labelButton: 'Connect with facebook',
                color: azul,
                isWithIcon: true,
                shape: const StadiumBorder(),
                icon: const AssetImage('assets/facebook.png'),
                // ignore: avoid_print
                func: () => print("hello"))
          ])
        ],
      ),
    );
  }
}
