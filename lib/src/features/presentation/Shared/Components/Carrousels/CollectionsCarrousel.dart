// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

import '../../../../domain/Entities/Collections/CollectionsEntity.dart';
import '../Cards/CollectionsCard/CollectionsCardView.dart';

class CollectionsCarrousel extends StatelessWidget {
  // Dependencies
  List<CollectionDetailEntity> collections;
  CollectionsCarrousel({Key? key, required this.collections}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 180.0,
        child: ListView.builder(
            itemCount: collections.length < 5 ? collections.length : 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return CollectionCardView(collection: collections[index]);
            }));
  }
}
