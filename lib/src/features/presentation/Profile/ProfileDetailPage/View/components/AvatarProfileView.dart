// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/utils/Styles/BoxShadowDecoration.dart';

@immutable
class AvatarProfileDetailView extends StatelessWidget {
  final String backgroundImage;

  const AvatarProfileDetailView({super.key, required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 142,
          height: 142,
          decoration: getBoxDecorationWithShadows(
              borderRadius: BorderRadius.circular(65)),
          child: CircleAvatar(backgroundImage: NetworkImage(backgroundImage)),
        )
      ],
    );
  }
}
