import 'package:flutter/material.dart';
// Colors
import 'package:flutter_application_test/src/colors/colors.dart';
// Commons Widgets
import 'package:flutter_application_test/src/features/presentation/commons_widgets/Headers/header_text_button.dart';

class EmptyOrderView extends StatelessWidget {
  const EmptyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGray,
      appBar: AppBar(
        elevation: 0.5,
        leading: const Text(''),
        backgroundColor: white,
        title: createText(
            texto: 'My Order',
            color: primaryColor,
            fontSize: 17,
            fontWeight: FontWeight.w600),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
                width: 216,
                height: 216,
                image: AssetImage('assets/emptyOrder.png')),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: createText(
                  texto: 'Cart Empty',
                  color: gris,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: createText(
                  texto:
                      'Good food is always cooking! Go ahead, order some yummy items from the menu.',
                  textAlign: TextAlign.center,
                  color: gris,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
