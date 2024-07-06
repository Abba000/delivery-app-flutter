// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/base/Views/BaseView.dart';
import 'package:flutter_application_test/src/features/domain/Entities/Collections/CollectionsEntity.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/MainCordinator/MainCordinator.dart';

import '../../../../Shared/Components/Carrousels/CollectionsCarrousel.dart';
import '../../../../Shared/Components/Headers/HeaderView.dart';

class CollectionsContentView extends StatelessWidget with BaseView {
  // Dependencies
  List<CollectionDetailEntity> collections = [];

  CollectionsContentView({Key? key, required this.collections})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return collections.isEmpty
        ? Container(height: 20)
        : Column(
            children: [
              GestureDetector(
                  onTap: () {
                    coordinator.showCollectionsPage(
                        context: context, collections: collections);
                  },
                  child: HeaderView(
                      textHeader: "Collections", textAction: "Show all")),
              CollectionsCarrousel(collections: collections)
            ],
          );
  }
}
