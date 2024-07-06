import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PriceFilterState createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  //Properties
  RangeValues _values = const RangeValues(0.3, 1.0);
  int _minPrice = 0;
  int _maxPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('$_minPrice Arg', style: const TextStyle(fontSize: 16)),
        SizedBox(
          width: 300,
          child: RangeSlider(
            activeColor: naranja,
            inactiveColor: gris,
            values: _values,
            min: 0,
            max: 100.0,
            onChanged: (RangeValues newValues) {
              setState(() {
                _values = newValues;
                _minPrice = _values.start.round();
                _maxPrice = _values.end.round();
              });
            },
          ),
        ),
        Text('$_maxPrice Arg', style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
