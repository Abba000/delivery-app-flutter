// ignore_for_file: file_names, use_build_context_synchronously, unused_element, unused_field

import 'package:flutter/material.dart';

import '../../../../base/Constants/LocalStorageKey.dart';
import '../../../../base/Views/BaseView.dart';
import '../../../domain/Entities/Collections/CollectionsEntity.dart';
import '../../../domain/Entities/DeliveryAddress/DeliveryAddressEntity.dart';
import '../../../domain/Entities/Order/OrderEntity.dart';
import '../../../domain/Entities/PaymentMethods/PaymentMethodsEntity.dart';
import '../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../../../domain/UseCases/LocalStorage/FetchLocalStorageUseCase.dart';
import '../../../domain/UseCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import '../../../domain/UseCases/LocalStorage/SaveLocalStorageUseCase.dart';
import '../../../domain/UseCases/User/ValidateCurrentUserUserCase/ValidateCurrentUserUserCase.dart';
import '../../Auth/welcome_page/View/welcome_pages.dart';
import '../../Collections/collection_detail_page/View/collection_detail_page.dart';
import '../../Collections/collection_detail_page/ViewModel/CollectionDetailPageViewModel.dart';
import '../../Collections/collections_page/View/collections_page.dart';
import '../../FilterPage/View/FilterPage.dart';
import '../../Filters/filter_page/view/filter_page.dart';
import '../../Places/PlaceDetailPage/View/PlaceDetailPage.dart';
import '../../Places/PlaceDetailPage/ViewModel/PlaceDetailViewModel.dart';
import '../../Places/PlaceRatingsPage/PlaceRatingsPage.dart';
import '../../Places/PopularPlacesListPage/View/PopularPlacesListPage.dart';

class RoutesPaths {
  static String welcomePath = "welcome";
  static String loginPath = "login";
  static String signUpPath = "sign-up";
  static String tabsPath = "Tabs";
  static String updatePasswordPath = "forgot-password";
  static String editPasswordPath = "edit-password";
  static String editEmailPath = "edit-email";
  static String changePaymentMethodsPath = "change-payments-methods";
}

class MainCoordinator {
  // Dependencies
  final FetchLocalStorageUseCase _fetchLocalStorageUseCase;
  final ValidateCurrentUserCase _validateCurrentUserCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  // Exposed Properties
  String? userUid;
  static MainCoordinator? sharedInstance = MainCoordinator();

  MainCoordinator(
      {FetchLocalStorageUseCase? fetchLocalStorageUseCase,
      ValidateCurrentUserCase? validateCurrentUserCase,
      SaveLocalStorageUseCase? saveLocalStorageUseCase})
      : _fetchLocalStorageUseCase =
            fetchLocalStorageUseCase ?? DefaultFetchLocalStorageUseCase(),
        _validateCurrentUserCase =
            validateCurrentUserCase ?? DefaultValidateCurrentUserCase(),
        _saveLocalStorageUseCase =
            saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  Future<String?> start(BuildContext context) {
    return _isUserLogged(context).then((value) {
      return value == null ? RoutesPaths.welcomePath : RoutesPaths.tabsPath;
    });
  }
}

extension AuthNavigation on MainCoordinator {
  showWelcomePage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPaths.welcomePath);
  }

  showLoginPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPaths.loginPath);
  }

  logoutNavigation({required BuildContext context}) {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => WelcomePage(),
            transitionDuration: const Duration(seconds: 0)));
  }

  showSignUpPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPaths.signUpPath);
  }

  showTabsPage({required BuildContext context, int? selectedTab}) {
    Navigator.pushNamed(context, RoutesPaths.tabsPath, arguments: selectedTab);
  }

  showUpdatePasswordPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPaths.updatePasswordPath);
  }
}

extension PlacesNavigation on MainCoordinator {
  showPlaceListPage(
      {required BuildContext context,
      required List<PlaceDetailEntity> popularPlaces}) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) =>
                PopularPlacesListPage(popularPlaces: popularPlaces),
            transitionDuration: const Duration(seconds: 0)));
  }

  showPlaceDetailPage(
      {required BuildContext context, required PlaceDetailEntity place}) async {
    await _saveLocalStorageUseCase.saveRecentSearchInLocalStorage(
        placeId: place.placeId);
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => PlaceDetailPage(
                viewModel: DefaultPlaceDetailViewModel(place: place)),
            transitionDuration: const Duration(seconds: 0)));
  }

  showCollectionsPage(
      {required BuildContext context,
      required List<CollectionDetailEntity> collections}) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) =>
                CollectionsPage(collections: collections),
            transitionDuration: const Duration(seconds: 0)));
  }

  showCollectionsDetailPage(
      {required BuildContext context,
      required CollectionDetailEntity collection}) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => CollectionDetailPage(
                collectionDetailPageViewModel:
                    DefaultCollectionDetailPageViewModel(
                        collection: collection)),
            transitionDuration: const Duration(seconds: 0)));
  }

  showFiltersPage(
      {required BuildContext context, required FilterPageDelegate delegate}) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => FilterPage(delegate: delegate),
            transitionDuration: const Duration(seconds: 0)));
  }

  showRatingsPage(
      {required BuildContext context,
      required List<PlaceRatingEntity> placeRatings}) {
    _pushPage(
        context: context, page: PlaceRatingsPage(placeRatings: placeRatings));
  }
}

extension PaymentMethodsNavigation on MainCoordinator {
  showEditPasswordPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPaths.editPasswordPath);
  }

  showEditEmailPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPaths.editEmailPath);
  }

  Future<T?> showChangePaymentsMethodsPage<T extends Object?>(
      {required BuildContext context}) {
    return Navigator.pushNamed(context, RoutesPaths.changePaymentMethodsPath);
  }

  showAddEditCardPage(
      {required BuildContext context,
      bool? isForEditing,
      bool? isForCreateAVisaCard,
      PaymentMethodEntity? paymentMethod,
      BaseViewStateDelegate? viewStateDelegate}) {
    _pushPage(
        context: context,
        page: AddEditCardPage(
            isEditing: isForEditing,
            isForCreateAVisaCard: isForCreateAVisaCard,
            paymentMethod: paymentMethod,
            viewStateDelegate: viewStateDelegate));
  }

  showAddEditPaypalAccountPage(
      {required BuildContext context,
      bool? isForEditing,
      PaymentMethodEntity? paymentMethod,
      BaseViewStateDelegate? viewStateDelegate}) {
    _pushPage(
        context: context,
        page: AddEditPaypalAccountPage(
            isEditing: isForEditing,
            paymentMethod: paymentMethod,
            viewStateDelegate: viewStateDelegate));
  }
}

extension DeliveryAddressNavigation on MainCoordinator {
  Future<T?> showChangeDeliveryAddress<T extends Object?>(
      {required BuildContext context}) {
    return _pushPageWithFuture(
        context: context, page: const ChangeDeliveryAddressPage());
  }

  showAddEditDeliveryAddress(
      {required BuildContext context,
      required bool? isForEditing,
      DeliveryAddressEntity? deliveryAddressEntity,
      required BaseViewStateDelegate? viewStateDelegate}) {
    _pushPage(
        context: context,
        page: AddEditDeliveryAddressPage(
            deliveryAddressEntity: deliveryAddressEntity,
            viewStateDelegate: viewStateDelegate,
            isEditing: isForEditing));
  }
}

extension OrdersNavigation on MainCoordinator {
  Future<T?> showOrderConfimationPage<T extends Object?>(
      {required BuildContext context, required OrderEntity order}) {
    return _pushPageWithFuture(
        context: context, page: OrderConfirmationPage(order: order));
  }
}

extension PrivateMethods on MainCoordinator {
  Future<String?> _isUserLogged(BuildContext context) async {
    var idToken = await _fetchLocalStorageUseCase.execute(
        fetchLocalParameteres:
            FetchLocalStorageParameters(key: LocalStorageKeys.idToken));
    userUid = idToken;
    return idToken;
  }

  Future<T?> _pushPageWithFuture<T extends Object?>(
      {required BuildContext context, required Widget page}) {
    return Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => page,
            transitionDuration: const Duration(seconds: 0)));
  }

  _pushPage({required BuildContext context, required Widget page}) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => page,
            transitionDuration: const Duration(seconds: 0)));
  }
}
