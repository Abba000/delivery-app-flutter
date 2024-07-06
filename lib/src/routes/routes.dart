import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/features/presentation/Auth/forgot_password_page/View/forgot_password.pages.dart';
// Pages
import 'package:flutter_application_test/src/features/presentation/Auth/welcome_page/View/welcome_pages.dart';
import 'package:flutter_application_test/src/features/presentation/Auth/login_page/View/login_pages.dart';
import 'package:flutter_application_test/src/features/presentation/Auth/sign_up_page/View/sign_up_pages.dart';
import 'package:flutter_application_test/src/features/presentation/Tabs/tabs_page/View/tabs_pages.dart';
//import 'package:flutter_application_test/src/features/presentation/Search/search_page/view/search_page.dart';
import 'package:flutter_application_test/src/features/presentation/Filters/filter_page/view/filter_page.dart';
//import 'package:flutter_application_test/src/features/presentation/Collections/collections_page/View/collections_page.dart';
//import 'package:flutter_application_test/src/features/presentation/Collections/collection_detail_page/View/collection_detail_page.dart';
import 'package:flutter_application_test/src/features/presentation/Profile/ProfileDetailPage/View/ProfileDetailPageView.dart';

final routes = <String, WidgetBuilder>{
  'welcome': (BuildContext context) => WelcomePage(),
  'login': (BuildContext context) => LoginPage(),
  'forgot-password': (BuildContext context) => const ForgotPassword(),
  'sign-up': (BuildContext context) => SignUpPage(),
  'tabs': (BuildContext context) => const TabsPage(),
  //'search': (BuildContext context) => const SearchPage(),
  'filter': (BuildContext context) => const FilterPage(),
  //'collections': (BuildContext context) => const CollectionsPage(),
  //'collections-detail': (BuildContext context) => CollectionDetailPage(),
  //'place-detail': (BuildContext context) => const PlaceDetailPage(),
  'profile-detail': (BuildContext context) => const ProfileDetailPage(),
};
