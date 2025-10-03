// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/MainCordinator/MainCordinator.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/user_state_provider.dart';

import '../../../../../../base/Views/BaseView.dart';
import '../../../../../../utils/Helpers/Checkout/CheckoutHelper.dart';
import '../../../../../domain/Entities/PaymentMethods/PaymentMethodsEntity.dart';
import '../../../../Profile/ChangePaymentsMethodsPage/View/Components/PaymentMethodsCard.dart';

mixin PaymentMethodsDelegate {
  mainPaymentMethodChanged();
}

class PaymentMethodsView extends StatefulWidget {
  final BaseViewStateDelegate? viewStateDelegate;

  const PaymentMethodsView({Key? key, this.viewStateDelegate})
      : super(key: key);

  @override
  State<PaymentMethodsView> createState() => _PaymentMethodsViewState();
}

class _PaymentMethodsViewState extends State<PaymentMethodsView>
    with
        BaseView,
        PaymentMethodCardViewDelegate,
        PaymentMethodCardViewDelegate {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: (context).getPaymentMethods(),
      builder: (BuildContext context,
          AsyncSnapshot<PaymentMethodsEntity?> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          if (snapshot.data?.hasPaymentMethods() ?? false) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 16, top: 16),
                    child: const Text("PAYMENT METHOD",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: _getProductCardsViews(
                        paymentMethodsEntity:
                            CheckoutHelper.getMainPaymentMethods(
                                entity: snapshot.data!)),
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        coordinator
                            .showChangePaymentsMethodsPage(context: context)
                            .then((value) {
                          setState(() {
                            widget.viewStateDelegate?.onChange();
                          });
                        });
                      },
                      child: Container(
                          margin: const EdgeInsets.only(right: 16, top: 16),
                          child: const Text("Edit payment method",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: rosa))),
                    )
                  ],
                )
              ],
            );
          } else {
            return Container(color: Colors.white);
          }
        } else {
          return Container(color: Colors.white);
        }
      },
    );
  }

  @override
  paymentMethodTapped(
      {required BuildContext context,
      required PaymentMethodEntity? paymentMethod,
      required PaymentMethodsTypes type}) {}

  @override
  selectMainPaymentMethodTapped(
      {required BuildContext context,
      required PaymentMethodEntity? paymentMethod}) {}

  List<Widget> _getProductCardsViews(
      {required PaymentMethodsEntity? paymentMethodsEntity}) {
    if (paymentMethodsEntity == null) {
      return [];
    }

    return paymentMethodsEntity.paymentMethods.map((paymentMethod) {
      return PaymentMethodCardView(
          paymentMethod: paymentMethod,
          delegate: this,
          defaultPaymentMethod:
              PaymentMethodsTypes.values.byName(paymentMethod.type));
    }).toList();
  }
}
