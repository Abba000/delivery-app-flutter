// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../ViewModel/ExploreTabViewModel.dart';
import 'CollectionsContentView.dart';
import 'NoveltyPlacesContentView.dart';
import 'PopularPlacesContentView.dart';
import 'SearchTopBar.dart';

class ExploreTabContentView extends StatelessWidget {
  final ExploreViewModel viewModel;

  const ExploreTabContentView({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverList(
          delegate: SliverChildListDelegate([
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SearchTopBar(),
                NoveltyPlacesContentView(
                    noveltyPlaces: viewModel.noveltyPlaces),
                PopularPlacesContentView(
                    popularPlaces: viewModel.popularPlaces),
                const SizedBox(
                  height: 10.0,
                ),
                CollectionsContentView(collections: viewModel.collections)
              ],
            ))
      ]))
    ]);
  }
}
