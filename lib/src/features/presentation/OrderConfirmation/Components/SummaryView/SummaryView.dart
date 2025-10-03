// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

import '../../../../../utils/Helpers/Checkout/CheckoutHelper.dart';
import '../../../../../utils/Styles/BoxShadowDecoration.dart';
import '../../../../domain/Entities/Order/OrderEntity.dart';

class SummaryView extends StatelessWidget {
  OrderEntity order;

  SummaryView({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: getBoxDecorationWithShadows(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("SUMMARY",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Container(
              margin: const EdgeInsets.only(top: 12),
              child: Divider(color: Colors.black.withOpacity(0.3))),
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Products",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                Text(CheckoutHelper.formatPriceInEuros(order.totalAmount),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Tax & Fees",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                Text(CheckoutHelper.formatPriceInEuros(order.fee),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Delivery",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                Text(CheckoutHelper.formatPriceInEuros(order.deliveryFee),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600))
              ],
            ),
          ),
          order.hasCourierTip()
              ? Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Courier",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400)),
                      Text(CheckoutHelper.formatPriceInEuros(order.courierTip),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600))
                    ],
                  ),
                )
              : Container(),
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(CheckoutHelper.formatPriceInEuros(order.totalAmountToPay),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 12),
              child: Divider(color: Colors.black.withOpacity(0.3))),
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 16),
            child: const Text(
                "Couriers earn between €4 and €5 on average for each order they deliver, plus tips.",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
  }
}
