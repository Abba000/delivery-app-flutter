// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/features/presentation/Places/PlaceDetailPage/View/Components/FlexibleSpaceBar/PlaceDetailInfoView.dart';
import 'package:flutter_application_test/src/features/presentation/Places/PlaceDetailPage/View/Components/FlexibleSpaceBar/PlaceDetailStatsInfoView.dart';
import 'package:flutter_application_test/src/features/presentation/Places/PlaceDetailPage/View/Components/FlexibleSpaceBar/PromoPlaceDetailView.dart';

import '../../../../../../../utils/Helpers/ScreenSize/screen_size_helper.dart';
import '../../../ViewModel/PlaceDetailViewModel.dart';

class FlexibleSpaceBarContentView extends StatelessWidget {
  PlaceDetailViewModel viewModel;

  FlexibleSpaceBarContentView({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Stack(
        children: [
          Image(
              width: double.infinity,
              height: getScreenHeight(context: context, multiplier: 0.50),
              fit: BoxFit.fill,
              image: NetworkImage(viewModel.place.imgs.first)),
          Container(
              decoration: const BoxDecoration(color: Colors.black45),
              width: double.infinity,
              height: getScreenHeight(context: context, multiplier: 0.50)),
          Container(
            height: getScreenHeight(context: context, multiplier: 0.50),
            margin: EdgeInsets.only(
                top: getScreenHeight(context: context, multiplier: 0.10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const PromoPlaceDetailView(),
                PlaceDetailInfoView(viewModel: viewModel),
                PlaceDetailStatsInfoView(viewModel: viewModel),
              ],
            ),
          )
        ],
      ),
    );
  }
}
