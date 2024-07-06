import 'package:flutter/material.dart';
//colors
import 'package:flutter_application_test/src/colors/colors.dart';
//Commons
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Headers/header_text_button.dart';
//utils
import 'package:flutter_application_test/src/utils/Styles/BoxShadowDecoration.dart';

Widget createFavouritesCard(
    {required BuildContext context,
    double marginTop = 15.0,
    double marginRight = 0.0,
    double marginBottom = 0.0,
    double marginLeft = 0.0,
    required ImageProvider<Object> image,
    required String title,
    required String subtitle,
    required String review,
    required String ratings,
    String buttonText = '',
    required bool hasActionButton,
    bool isFavourite = true}) {
  return Container(
    margin: EdgeInsets.only(
        top: marginTop,
        right: marginRight,
        bottom: marginBottom,
        left: marginLeft),
    padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
    width: double.infinity,
    decoration: getBoxDecorationWithShadows(),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child:
              Image(width: 90.0, height: 90.0, fit: BoxFit.cover, image: image),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 7.0),
                      child: createText(
                          texto: title,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
                  const SizedBox(
                    width: 25.0,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.bookmark,
                        size: 32.0,
                        color: isFavourite ? rosa : Colors.grey[300],
                      ),
                      onPressed: () {})
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 5.0),
                child: createText(
                    texto: subtitle,
                    color: gris,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.star, color: amarillo, size: 16),
                  createText(
                      texto: review,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0),
                  const SizedBox(width: 5.0),
                  createText(
                      texto: ratings,
                      color: gris,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
