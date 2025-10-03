// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/MainCordinator/MainCordinator.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/user_state_provider.dart';
import '../../../../../../base/Views/BaseView.dart';
import '../../../../../../Colors/Colors.dart';
import '../../../../../../Utils/Styles/BoxShadowDecoration.dart';
import '../../../../../../utils/Helpers/Checkout/CheckoutHelper.dart';
import '../../../../../../utils/Helpers/ScreenSize/screen_size_helper.dart';
import '../../../../../domain/Entities/PaymentMethods/PaymentMethodsEntity.dart';
import 'PaymentMethodsCard.dart';

class ChangePaymentsMethodsContentView extends StatelessWidget with BaseView {
  final PaymentMethodsEntity? paymentMethods;
  BaseViewStateDelegate? delegate;

  ChangePaymentsMethodsContentView(
      {Key? key, required this.paymentMethods, required this.delegate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          const SizedBox(height: 16),
          paymentMethods?.hasPaymentMethods() ?? false
              ? PaymentCardsView(
                  paymentMethods: paymentMethods, delegate: delegate)
              : Container()
        ]))
      ],
    );
  }
}

class PaymentCardsView extends StatelessWidget
    with BaseView, PaymentMethodCardViewDelegate {
  final PaymentMethodsEntity? paymentMethods;
  BaseViewStateDelegate? delegate;

  PaymentCardsView(
      {Key? key, required this.paymentMethods, required this.delegate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getBoxDecorationWithShadows(),
      width: getScreenWidth(context: context),
      margin: const EdgeInsets.only(left: 16, right: 16),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text("These are the payment methods you've added.",
              style: TextStyle(fontSize: 15, color: primaryColor)),
          const SizedBox(height: 20),
          PaymentMethodCardsView(
              paymentMethods: paymentMethods, delegate: this),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  @override
  paymentMethodTapped(
      {required BuildContext context,
      required PaymentMethodEntity? paymentMethod,
      required PaymentMethodsTypes type}) {
    switch (paymentMethod?.type) {
      case "paypal":
        coordinator.showAddEditPaypalAccountPage(
            context: context,
            isForEditing: true,
            paymentMethod: paymentMethod,
            viewStateDelegate: delegate);
        break;
      case "visa":
        coordinator.showAddEditCardPage(
            context: context,
            isForEditing: true,
            isForCreateAVisaCard: true,
            paymentMethod: paymentMethod,
            viewStateDelegate: delegate);
        break;
      case "mastercard":
        coordinator.showAddEditCardPage(
            context: context,
            isForEditing: true,
            isForCreateAVisaCard: false,
            paymentMethod: paymentMethod,
            viewStateDelegate: delegate);
        break;
      default:
        break;
    }
  }

  @override
  selectMainPaymentMethodTapped(
      {required BuildContext context,
      required PaymentMethodEntity? paymentMethod}) {
    if (paymentMethod == null) {
      return;
    }
    (context)
        .selectMainPaymentMethod(parameter: paymentMethod)
        .then((_) => delegate?.onChange());
  }
}
