// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/base/Views/BaseView.dart';
import 'package:flutter_application_test/src/colors/colors.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/LoadingStatusProvider.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/user_state_provider.dart';
import 'package:flutter_application_test/src/routes/routes.dart';
import 'package:provider/provider.dart';

import 'src/features/presentation/Shared/MainCordinator/MainCordinator.dart';
import 'src/features/presentation/Shared/StateProviders/ErrorStateProvider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoadingStateProvider()),
        ChangeNotifierProvider(create: (_) => DefaultUserStateProvider()),
        ChangeNotifierProvider(create: (_) => ErrorStateProvider())
      ],
      child: MyAppUserState(),
    );
  }
}

class MyAppUserState extends StatelessWidget with BaseView {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MainCoordinator.sharedInstance?.start(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            Provider.of<DefaultUserStateProvider>(context).fetchUserData(
                localId: MainCoordinator.sharedInstance?.userUid ?? "");
            return MyApp(initialRoute: snapshot.data);
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

class MyApp extends StatelessWidget {
  final String _initialRoute;

  const MyApp({super.key, required String initialRoute})
      : _initialRoute = initialRoute;

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: _initialRoute,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: naranja,
          appBarTheme:
              const AppBarTheme(iconTheme: IconThemeData(color: Colors.black))),
      localizationsDelegates: const [
        //GlobalMaterialLocalizations.delegate,
        //GlobalWidgetsLocalizations.delegate,
        //GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
      ],
    );
  }
}
