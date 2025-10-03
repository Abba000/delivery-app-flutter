import 'package:flutter/material.dart';

//import 'package:flutter_application_test/src/features/presentation/Auth/forgot_password_page/View/forgot_password.pages.dart';
// Pages
import 'package:flutter_application_test/src/features/presentation/Auth/welcome_page/View/welcome_pages.dart';
import 'package:flutter_application_test/src/features/presentation/Auth/login_page/View/login_pages.dart';
import 'package:flutter_application_test/src/features/presentation/Auth/sign_up_page/View/sign_up_pages.dart';
import 'package:flutter_application_test/src/features/presentation/CheckoutPage/View/CheckoutPage.dart';
import 'package:flutter_application_test/src/features/presentation/Tabs/tabs_page/View/tabs_pages.dart';
//import 'package:flutter_application_test/src/features/presentation/Collections/collections_page/View/collections_page.dart';
//import 'package:flutter_application_test/src/features/presentation/Collections/collection_detail_page/View/collection_detail_page.dart';
import 'package:flutter_application_test/src/features/presentation/Profile/ProfileDetailPage/View/ProfileDetailPageView.dart';

import '../features/presentation/Auth/forgot_password_page/View/forgot_password.pages.dart';
import '../features/presentation/Profile/ChangePaymentsMethodsPage/View/ChangePaymentsMethodsPage.dart';
import '../features/presentation/Profile/EditEmailPage/View/EditEmailPage.dart';
import '../features/presentation/Profile/EditPasswordPage/View/EditPasswordView.dart';
import '../features/presentation/Shared/MainCordinator/MainCordinator.dart';

final routes = <String, WidgetBuilder>{
  'welcome': (BuildContext context) => WelcomePage(),
  'login': (BuildContext context) => LoginPage(),
  'forgot-password': (BuildContext context) => const UpdatePasswordPage(),
  'sign-up': (BuildContext context) => SignUpPage(),
  'Tabs': (BuildContext context) => const TabsPage(),
  'profile-detail': (BuildContext context) => const ProfileDetailPage(),
  'checkout': (BuildContext context) => const CheckOutPage(),
  RoutesPaths.editPasswordPath: (BuildContext context) =>
      const EditPasswordPage(),
  RoutesPaths.editEmailPath: (BuildContext context) => const EditEmailPage(),
  RoutesPaths.changePaymentMethodsPath: (BuildContext context) =>
      const ChangePaymentsMethodsPage()
};
