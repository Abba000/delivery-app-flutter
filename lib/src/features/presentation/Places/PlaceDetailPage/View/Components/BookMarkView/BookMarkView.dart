// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import '../../../../../../../Colors/Colors.dart';
import '../../../ViewModel/PlaceDetailViewModel.dart';

class BookMarkView extends StatelessWidget {
  PlaceDetailViewModel viewModel;

  BookMarkView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: viewModel.isUserFavouritePlaceStream,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          bool isUserFavourite = snapshot.data ?? false;

          return IconButton(
              icon: Icon(
                isUserFavourite ? Icons.bookmark : Icons.bookmark_border,
                color: isUserFavourite ? rosa : Colors.white,
                size: 30,
              ),
              onPressed: () {
                viewModel.favouriteIconTapped(!isUserFavourite);
              });
        });
  }
}
