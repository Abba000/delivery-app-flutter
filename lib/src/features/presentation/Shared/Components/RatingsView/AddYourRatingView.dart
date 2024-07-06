// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';
import '../../../../../features/presentation/Shared/Components/Texts/TextView/View/TextView.dart';
import '../../commons_widgets/Texts/DoubleTextView/View/DoubleTextView.dart';
import 'YourRatingView.dart';

class AddYourRatingView extends StatelessWidget {
  const AddYourRatingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const DoubleTextView(textHeader: "Your Rating", textAction: ""),
          const SizedBox(height: 16.0),
          RatingsButtons(itemSelected: 5),
          Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: naranja.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
            height: 180,
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              onChanged: (value) {},
              decoration: const InputDecoration(
                  hintText: 'What do you think of this place?',
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(top: 16),
              child: const TextView(
                  texto: "+Add your review", // Esto cuando ya tenga review
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                  color: naranja),
            ),
          )
        ],
      ),
    );
  }
}
