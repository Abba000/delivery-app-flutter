// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

import '../../../../../../Utils/Helpers/Checkout/CheckoutHelper.dart';
import '../../../../../../Utils/Styles/BoxShadowDecoration.dart';
import '../../../Models/CourierTipModel.dart';

mixin CourierTipViewDelegate {
  courierTipChanged({required TipModel model});
}

class TipView extends StatelessWidget {
  CourierTipViewDelegate? delegate;

  final TipModel model;

  TipView({Key? key, required this.model, this.delegate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => delegate?.courierTipChanged(model: model),
      child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(top: 8.0),
          decoration: model.isSelected
              ? defaultTextFieldDecoration
              : borderGrayDecoration,
          child: Text(CheckoutHelper.formatPriceInEuros(model.tip),
              style: const TextStyle(fontSize: 17))),
    );
  }
}
