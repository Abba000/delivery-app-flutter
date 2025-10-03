// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

import '../../../../../utils/Styles/BoxShadowDecoration.dart';
import '../../Models/CourierTipModel.dart';
import 'Components/TipView.dart';

class CourierTipView extends StatefulWidget {
  CourierTipViewDelegate? delegate;

  CourierTipView({Key? key, this.delegate}) : super(key: key);

  @override
  State<CourierTipView> createState() => _CourierTipViewState();
}

class _CourierTipViewState extends State<CourierTipView>
    with CourierTipViewDelegate {
  List<TipModel> tips = [
    TipModel(tip: 0.00, isSelected: true, id: '1'),
    TipModel(tip: 1.00, isSelected: false, id: '2'),
    TipModel(tip: 2.00, isSelected: false, id: '3'),
    TipModel(tip: 3.00, isSelected: false, id: '4')
  ];

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
              child: const Text("COURIER TIP",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
          Container(
            margin:
                const EdgeInsets.only(left: 16, top: 12, right: 16, bottom: 24),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: tips.map((tip) {
                  return TipView(model: tip, delegate: this);
                }).toList()),
          )
        ],
      ),
    );
  }

  @override
  courierTipChanged({required TipModel model}) {
    setState(() {
      tips = tips.map((tip) {
        var newTip = tip;
        newTip.isSelected = newTip.id == model.id ? true : false;
        return newTip;
      }).toList();
      widget.delegate?.courierTipChanged(model: model);
    });
  }
}
