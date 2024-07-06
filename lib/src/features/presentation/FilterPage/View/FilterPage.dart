// ignore_for_file: file_names, prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';

import '../../../../base/Views/BaseView.dart';
import '../../../domain/Entities/Places/FiltersModelEntity.dart';
import '../../Error/ErrorAlertView.dart';
import '../../Shared/commons_widgets/Texts/TextView/View/TextView.dart';
import '../ViewModel/FilterPageViewModel.dart';
import 'components/FilterPageContentView.dart';

mixin FilterPageDelegate {
  applyFilters({required FiltersModelEntity filters});
}

class FilterPage extends StatefulWidget {
  final FilterPageDelegate? delegate;

  FilterPage({Key? key, this.delegate}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> with BaseView {
  FilterPageViewModel viewModel;

  _FilterPageState({FilterPageViewModel? filterPageViewModel})
      : viewModel = filterPageViewModel ?? DefaultFilterPageViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: const TextView(texto: 'Filters', fontWeight: FontWeight.w600),
        leading: Container(
            padding: const EdgeInsets.only(top: 20, left: 9.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  viewModel.filtersModel.resetFilters();
                });
              },
              child: const TextView(
                  texto: 'Reset', fontWeight: FontWeight.w500, fontSize: 17.0),
            )),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              widget.delegate?.applyFilters(filters: viewModel.filtersModel);
            },
            child: Container(
                padding: const EdgeInsets.only(top: 20, right: 10.0),
                child: const TextView(
                    texto: 'Done',
                    color: naranja,
                    fontWeight: FontWeight.w500,
                    fontSize: 17.0)),
          )
        ],
      ),
      body: FutureBuilder(
          future: viewModel.viewInitState(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return loadingView;
              case ConnectionState.done:
                switch (snapshot.data) {
                  case FilterPageViewModelState.viewLoadedState:
                    return FilterPageContentView(viewModel: viewModel);
                  default:
                    return ErrorView();
                }
              default:
                return loadingView;
            }
          }),
    );
  }
}
