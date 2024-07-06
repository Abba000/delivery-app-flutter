// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../ViewModel/SearchPageViewModel.dart';

class QuerySuggestionView extends StatelessWidget {
  final String suggestion;
  final SearchPageViewModel viewModel;

  const QuerySuggestionView(
      {Key? key, required this.suggestion, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          const Icon(Icons.search),
          const SizedBox(width: 6),
          Text(suggestion)
        ],
      ),
    );
  }
}
