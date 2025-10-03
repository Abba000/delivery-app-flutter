// ignore_for_file: must_be_immutable, avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/features/presentation/Error/ErrorAlertView.dart';
import 'package:flutter_application_test/src/features/presentation/Profile/ChangePaymentsMethodsPage/View/Components/ChangePaymentsMethodsContentView.dart';
import 'package:flutter_application_test/src/features/presentation/Profile/ChangePaymentsMethodsPage/View/Components/PaymentMethodsCard.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/MainCordinator/MainCordinator.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/user_state_provider.dart';
import 'package:flutter_application_test/src/utils/Helpers/ScreenSize/screen_size_helper.dart';

import '../../../../../Utils/Styles/BoxShadowDecoration.dart';
import '../../../../../base/Views/BaseView.dart';
import '../../../../../colors/colors.dart';
import '../../../../../utils/Helpers/Checkout/CheckoutHelper.dart';
import '../../../../domain/Entities/PaymentMethods/PaymentMethodsEntity.dart';
import '../../../Shared/Components/BackButtons/BackButtonView/View/BackButtonView.dart';

class ChangePaymentsMethodsPage extends StatefulWidget {
  const ChangePaymentsMethodsPage({Key? key}) : super(key: key);

  @override
  State<ChangePaymentsMethodsPage> createState() =>
      _ChangePaymentsMethodsPageState();
}

class _ChangePaymentsMethodsPageState extends State<ChangePaymentsMethodsPage>
    with BaseView, BaseViewStateDelegate {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FooterView(delegate: this),
        appBar: AppBar(
            title: const Text("Payment Methods",
                style: TextStyle(fontSize: 17, color: Colors.black)),
            backgroundColor: white,
            elevation: 0.4,
            leading: Builder(
              builder: (BuildContext context) {
                return const BackButtonView(color: Colors.black);
              },
            )),
        body: FutureBuilder(
            future: (context).getPaymentMethods(),
            builder: (BuildContext context,
                AsyncSnapshot<PaymentMethodsEntity?> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return loadingView;
                case ConnectionState.done:
                  if (snapshot.hasData && snapshot.data != null) {
                    return ChangePaymentsMethodsContentView(
                        paymentMethods: snapshot.data, delegate: this);
                  } else {
                    return ErrorView();
                  }
                default:
                  return loadingView;
              }
            }));
  }

  @override
  void onChange() {
    print("+++++++++ onChange");
    setState(() {});
  }
}

class FooterView extends StatelessWidget
    with BaseView, PaymentMethodCardViewDelegate {
  BaseViewStateDelegate? delegate;

  FooterView({Key? key, required this.delegate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getBoxDecorationWithShadows(),
      width: getScreenWidth(context: context),
      height: 220,
      margin: const EdgeInsets.only(left: 16, right: 16),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          PaymentMethodCardView(
              defaultTitle: 'Añadir nueva cuenta de Paypal',
              defaultPaymentMethod: PaymentMethodsTypes.paypal,
              delegate: this),
          PaymentMethodCardView(
              defaultTitle: 'Añadir nueva tarjeta Visa',
              defaultPaymentMethod: PaymentMethodsTypes.visa,
              delegate: this),
          PaymentMethodCardView(
              defaultTitle: 'Añadir nueva tarjeta Mastercard',
              defaultPaymentMethod: PaymentMethodsTypes.mastercard,
              delegate: this)
        ],
      ),
    );
  }

  @override
  paymentMethodTapped(
      {required BuildContext context,
      required PaymentMethodEntity? paymentMethod,
      required PaymentMethodsTypes type}) {
    switch (type) {
      case PaymentMethodsTypes.paypal:
        coordinator.showAddEditPaypalAccountPage(
            context: context, isForEditing: false, viewStateDelegate: delegate);
        break;
      case PaymentMethodsTypes.visa:
        coordinator.showAddEditCardPage(
            context: context,
            isForEditing: false,
            isForCreateAVisaCard: true,
            viewStateDelegate: delegate);
        break;
      case PaymentMethodsTypes.mastercard:
        coordinator.showAddEditCardPage(
            context: context,
            isForEditing: false,
            isForCreateAVisaCard: false,
            viewStateDelegate: delegate);
        break;
      default:
        break;
    }
  }

  @override
  selectMainPaymentMethodTapped(
      {required BuildContext context,
      required PaymentMethodEntity? paymentMethod}) {}
}
