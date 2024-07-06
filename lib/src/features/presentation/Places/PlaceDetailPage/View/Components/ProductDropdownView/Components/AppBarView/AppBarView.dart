// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import '../../../../../../../../../Colors/Colors.dart';
import '../../../../../../../../../utils/Helpers/ScreenSize/screen_size_helper.dart';
import '../../../../../../../Shared/Components/BackButtons/BackButtonView/View/BackButtonView.dart';
import '../../../../../ViewModel/PlaceDetailViewModel.dart';
import '../../../BookMarkView/BookMarkView.dart';
import '../../../FlexibleSpaceBar/FlexibleSpaceBarContentView.dart';
import '../../../ShareIconView/ShareIconView.dart';

class AppBarView extends StatelessWidget {
  PlaceDetailViewModel viewModel;

  AppBarView({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: naranja,
      expandedHeight: getScreenHeight(context: context, multiplier: 0.40),
      flexibleSpace: FlexibleSpaceBarContentView(viewModel: viewModel),
      leading: Builder(builder: (BuildContext context) {
        return const BackButtonView(color: Colors.white);
      }),
      actions: [
        ShareIconView(viewModel: viewModel),
        BookMarkView(viewModel: viewModel)
      ],
    );
  }
}
