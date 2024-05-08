import 'package:flutter/material.dart';
//ui
import 'package:flutter/services.dart';
//colors
import 'package:flutter_application_test/src/colors/colors.dart';
//widgets
import 'package:flutter_application_test/src/features/presentation/commons_widgets/BackButtons/back_button.dart';
import 'package:flutter_application_test/src/features/presentation/commons_widgets/Buttons/rounded_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Stack(
            children: [
              const Image(
                width: double.infinity,
                height: 350.0,
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50.0),
                child: backButton(context, Colors.white),
              ),
            ],
          ),
          Transform.translate(
            offset: const Offset(0.0, -20.0),
            child: Container(
              width: double.infinity,
              height: 500.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        "Welcome Back",
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                      const Text(
                        "Login to you account",
                        style: TextStyle(
                          color: gris,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                        ),
                      ),
                      _emailInput(),
                      _passwordInput(),
                      createElevatedButton(
                          color: naranja,
                          labelButton: 'Log in',
                          shape: const StadiumBorder(),
                          func: () {
                            Navigator.pushNamed(context, 'tabs');
                          }),
                      Container(
                        margin: const EdgeInsets.only(top: 30.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'forgot-password');
                          },
                          child: const Text(
                            'Forgot you password?',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 17.0),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  color: gris,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'sign-up');
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                      color: naranja,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
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
          hintText: 'Email',
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          )),
    ),
  );
}

Widget _passwordInput() {
  return Container(
    margin: const EdgeInsets.only(top: 15.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(142, 142, 147, 1.2),
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: const TextField(
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password',
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          )),
    ),
  );
}
