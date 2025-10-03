// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

import '../../../../../utils/Styles/BoxShadowDecoration.dart';
import '../../../../domain/Entities/Order/OrderEntity.dart';
import '../../../Shared/Components/TextFormField/CustomTextFormFields.dart';

mixin DeliveryDetailsViewDelegate {
  deliveryDetailsChanged({required OrderEntity order});
}

class DeliveryDetailsView extends StatefulWidget {
  OrderEntity order;
  DeliveryDetailsViewDelegate? delegate;

  DeliveryDetailsView({Key? key, required this.order, this.delegate})
      : super(key: key);

  @override
  State<DeliveryDetailsView> createState() => _DeliveryDetailsViewState();
}

class _DeliveryDetailsViewState extends State<DeliveryDetailsView>
    with TextFormFieldDelegate {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: getBoxDecorationWithShadows(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(left: 16, top: 16),
              child: const Text("DELIVERY TIME",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
          Container(
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
              decoration: defaultTextFieldDecoration,
              width: double.infinity,
              height: 52,
              child: Text(
                  widget.order.deliveryTimeIsAsap() ? "Lo antes posible" : "",
                  style: const TextStyle(fontSize: 17))),
          Container(
              margin: const EdgeInsets.only(left: 16, top: 16),
              child: const Text("NOTES",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
          Container(
            margin: const EdgeInsets.only(
                top: 8.0, left: 16, right: 16, bottom: 24),
            child: CustomTextFormField(
              delegate: this,
              hintext: 'Ponle mucho queso a la pizza',
              textFormFieldType: CustomTextFormFieldType.notes,
              decoration: defaultTextFieldDecoration,
              initialValue: widget.order.deliveryNotes,
              enabled: true,
              minLines: 6,
              isTextArea: true,
            ),
          )
        ],
      ),
    );
  }

  @override
  onChanged(
      {required String newValue,
      required CustomTextFormFieldType customTextFormFieldType}) {
    switch (customTextFormFieldType) {
      case CustomTextFormFieldType.notes:
        widget.order.deliveryNotes = newValue;
        widget.delegate?.deliveryDetailsChanged(order: widget.order);
      default:
        break;
    }
  }
}
