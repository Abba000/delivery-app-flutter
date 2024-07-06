// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';

class PriceFilter extends StatefulWidget {
  @override
  _PriceFilterState createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  // Properties
  double _value = 0.0;
  int _maxPrize = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 305,
          child: Slider(
            activeColor: naranja,
            inactiveColor: gris,
            min: 0,
            max: 200.0,
            value: _value,
            onChanged: (double value) {
              setState(() {
                _value = value;
                _maxPrize = _value.round();
              });
            },
          ),
        ),
        Text('$_maxPrize €', style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
