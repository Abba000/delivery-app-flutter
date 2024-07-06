// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import '../../../ViewModel/PlaceDetailViewModel.dart';

class ShareIconView extends StatelessWidget {
  PlaceDetailViewModel viewModel;

  ShareIconView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(
          Icons.ios_share,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {});
  }
}
