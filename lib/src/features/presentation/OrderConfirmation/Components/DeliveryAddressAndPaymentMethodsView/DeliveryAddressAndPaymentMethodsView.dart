// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../../base/Views/BaseView.dart';
import '../../../../../Utils/Styles/BoxShadowDecoration.dart';
import 'Components/DeliveryAddressView.dart';
import 'Components/PaymentMethodsView.dart';

class DeliveryAddressAndPaymentMethodsView extends StatelessWidget {
  final BaseViewStateDelegate? viewStateDelegate;

  const DeliveryAddressAndPaymentMethodsView({Key? key, this.viewStateDelegate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: getBoxDecorationWithShadows(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DeliveryAddressView(viewStateDelegate: viewStateDelegate),
          PaymentMethodsView(viewStateDelegate: viewStateDelegate),
          const SizedBox(height: 18)
        ],
      ),
    );
  }
}
