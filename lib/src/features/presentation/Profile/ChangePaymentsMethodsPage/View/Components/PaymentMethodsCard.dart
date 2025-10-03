// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

import '../../../../../../Utils/Styles/BoxShadowDecoration.dart';
import '../../../../../../utils/Helpers/Checkout/CheckoutHelper.dart';
import '../../../../../domain/Entities/PaymentMethods/PaymentMethodsEntity.dart';

class PaymentMethodCardsView extends StatelessWidget {
  final PaymentMethodsEntity? paymentMethods;
  final PaymentMethodCardViewDelegate? delegate;

  const PaymentMethodCardsView(
      {Key? key, required this.paymentMethods, this.delegate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getPaymentMethodsCard(),
    );
  }

  List<Widget> getPaymentMethodsCard() {
    if (paymentMethods == null) {
      return [];
    }

    return paymentMethods?.paymentMethods.map((paymentMethod) {
          return PaymentMethodCardView(
              paymentMethod: paymentMethod,
              delegate: delegate,
              defaultPaymentMethod:
                  PaymentMethodsTypes.values.byName(paymentMethod.type));
        }).toList() ??
        [];
  }
}

mixin PaymentMethodCardViewDelegate {
  paymentMethodTapped(
      {required BuildContext context,
      required PaymentMethodEntity? paymentMethod,
      required PaymentMethodsTypes type});
  selectMainPaymentMethodTapped(
      {required BuildContext context,
      required PaymentMethodEntity? paymentMethod});
}

class PaymentMethodCardView extends StatelessWidget {
  String? defaultTitle;
  PaymentMethodsTypes defaultPaymentMethod;
  PaymentMethodEntity? paymentMethod;

  Decoration? decoration;
  PaymentMethodCardViewDelegate? delegate;

  PaymentMethodCardView(
      {Key? key,
      required this.defaultPaymentMethod,
      this.paymentMethod,
      this.defaultTitle,
      this.decoration,
      this.delegate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration ?? _getBoxDecoration(),
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              delegate?.paymentMethodTapped(
                  paymentMethod: paymentMethod,
                  context: context,
                  type: defaultPaymentMethod);
            },
            child: Row(
              children: [
                Image(
                    image: AssetImage(_getAssetImageName()),
                    width: 26,
                    height: 26),
                const SizedBox(width: 16),
                Text(_getCardTitle(), style: const TextStyle(fontSize: 17))
              ],
            ),
          ),
          defaultTitle == null
              ? GestureDetector(
                  onTap: () {
                    if (paymentMethod?.isMainPaymentMethod == false) {
                      delegate?.selectMainPaymentMethodTapped(
                          context: context, paymentMethod: paymentMethod);
                    }
                  },
                  child: Image(
                      image: AssetImage(
                          paymentMethod?.isMainPaymentMethod ?? false
                              ? "assets/check_order_fill.png"
                              : "assets/iconInactive.png"),
                      width: 26,
                      height: 26),
                )
              : Container()
        ],
      ),
    );
  }

  String _getCardTitle() {
    if (defaultTitle == null) {
      return paymentMethod?.type == PaymentMethodsTypes.paypal.name
          ? paymentMethod?.email ?? ""
          : CheckoutHelper.obfuscateCardNumber(paymentMethod?.cardNumber ?? "");
    } else {
      return defaultTitle ?? "";
    }
  }

  String _getAssetImageName() {
    return CheckoutHelper.getPaymentMethodAssetImage(
        paymentMethod: defaultPaymentMethod);
  }

  Decoration _getBoxDecoration() {
    return paymentMethod?.isMainPaymentMethod ?? false
        ? defaultTextFieldDecoration
        : borderGrayDecoration;
  }
}
