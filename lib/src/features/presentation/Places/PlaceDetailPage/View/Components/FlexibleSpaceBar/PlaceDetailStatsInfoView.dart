// ignore_for_file: unnecessary_string_interpolations, unnecessary_brace_in_string_interps, prefer_interpolation_to_compose_strings, file_names, must_be_immutable

import 'package:flutter/material.dart';
import '../../../../../../../Colors/colors.dart';
import '../../../../../Shared/commons_widgets/Texts/TextView/View/TextView.dart';
import '../../../ViewModel/PlaceDetailViewModel.dart';

class PlaceDetailStatsInfoView extends StatelessWidget {
  PlaceDetailViewModel viewModel;

  PlaceDetailStatsInfoView({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 26.0),
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      height: 70.0,
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.white),
              bottom: BorderSide(color: Colors.white))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VerticalStatsView(
              title: "${viewModel.place.ratingAverage}",
              subtitle: "${viewModel.place.ratings} Ratings",
              icon: Icons.star),
          Container(
            height: 40,
            decoration: const BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white))),
          ),
          VerticalStatsView(
              title: _getFavouritesCount(),
              subtitle: "Favourites",
              icon: Icons.bookmark),
          Container(
            height: 40,
            decoration: const BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white))),
          ),
          VerticalStatsView(
              title: viewModel.place.averageDelivery.isEmpty
                  ? "20-30'"
                  : "${viewModel.place.averageDelivery}'",
              subtitle: "Delivery",
              icon: Icons.punch_clock)
        ],
      ),
    );
  }

  String _getFavouritesCount() {
    int count = viewModel.place.favourites.length;

    if (count < 1000) {
      return count.toString();
    } else {
      return (count / 1000).toStringAsFixed(1) + 'K';
    }
  }
}

class VerticalStatsView extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String subtitle;

  const VerticalStatsView(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Icon(
            icon,
            color: Colors.white,
            size: 19.0,
          ),
          TextView(
              texto: '${title}',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15.0)
        ]),
        TextView(
            texto: "${subtitle}",
            color: gris,
            fontWeight: FontWeight.w500,
            fontSize: 15.0)
      ],
    );
  }
}
