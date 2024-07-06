// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Texts/TextView/View/TextView.dart';

abstract class DoubleTextDropdownViewDelegate {
  dropDownTapped({required bool isExpanded});
}

// ignore: must_be_immutable
class DoubleTextDropdownView extends StatefulWidget {
  final String textHeader;
  final Function()? textActionTapped;
  bool isExpanded;
  DoubleTextDropdownViewDelegate? delegate;

  DoubleTextDropdownView(
      {super.key,
      required this.textHeader,
      required this.isExpanded,
      this.textActionTapped,
      this.delegate});

  @override
  State<DoubleTextDropdownView> createState() => _DoubleTextDropdownViewState();
}

class _DoubleTextDropdownViewState extends State<DoubleTextDropdownView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextView(
                texto: widget.textHeader,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
            Transform.translate(
              offset: const Offset(20, 0),
              child: Row(
                children: [
                  const Text("5", style: TextStyle(color: gris)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          widget.isExpanded = !widget.isExpanded;
                          widget.delegate
                              ?.dropDownTapped(isExpanded: widget.isExpanded);
                        });
                      },
                      icon: Icon(
                          widget.isExpanded
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          color: gris)),
                ],
              ),
            )
          ],
        ),
        const Divider()
      ],
    );
  }
}
