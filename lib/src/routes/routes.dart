import 'package:flutter/material.dart';
// Pages
import 'package:flutter_application_test/src/features/presentation/welcome_page/View/welcome_pages.dart';
import 'package:flutter_application_test/src/features/presentation/login_page/View/login_pages.dart';
import 'package:flutter_application_test/src/features/presentation/forgot_password_page/View/forgot_password.pages.dart';
import 'package:flutter_application_test/src/features/presentation/sign_up_page/View/sign_up_pages.dart';
import 'package:flutter_application_test/src/features/presentation/tabs/tabs_pages.dart';
import 'package:flutter_application_test/src/features/presentation/search_page/view/search_page.dart';
import 'package:flutter_application_test/src/features/presentation/filter_page/view/filter_page.dart';
import 'package:flutter_application_test/src/features/presentation/collections_page/View/collections_page.dart';
import 'package:flutter_application_test/src/features/presentation/collection_detail_page/View/collection_detail_page.dart';
import 'package:flutter_application_test/src/features/presentation/place_detail_page/View/place_detail_page.dart';
import 'package:flutter_application_test/src/features/presentation/profile_detail_page/View/profile_detail_page.dart';

final routes = <String, WidgetBuilder>{
  'welcome': (BuildContext context) => const WelcomePage(),
  'login': (BuildContext context) => const LoginPage(),
  'forgot-password': (BuildContext context) => const ForgotPasswordPage(),
  'sign-up': (BuildContext context) => const SignUpPage(),
  'tabs': (BuildContext context) => const TabsPage(),
  'search': (BuildContext context) => const SearchPage(),
  'filter': (BuildContext context) => const FilterPage(),
  'collections': (BuildContext context) => const CollectionsPage(),
  'collections-detail': (BuildContext context) => const CollectionDetailPage(),
  'place-detail': (BuildContext context) => const PlaceDetailPage(),
  'profile-detail': (BuildContext context) => ProfileDetailPage(),
};
