import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
            color: Colors.black,
          ))),
      routes: routes,
      initialRoute: 'welcome',
    );
  }
}
