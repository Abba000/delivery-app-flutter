// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../../../domain/Entities/Collections/CollectionsEntity.dart';
import '../../../Shared/Components/BackButtons/BackButtonView/View/BackButtonView.dart';
import '../../../Shared/Components/Cards/CollectionsCard/CollectionsGridCardView.dart';
import '../../../Shared/Components/Texts/TextView/View/TextView.dart';

class CollectionsPage extends StatelessWidget {
  // Dependencies
  List<CollectionDetailEntity> collections;

  CollectionsPage({Key? key, required this.collections}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              title: const TextView(texto: 'Collections', fontSize: 17),
              leading: Builder(builder: (BuildContext context) {
                return const BackButtonView(color: Colors.black);
              }),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 30.0, right: 20.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    crossAxisCount: 2,
                    childAspectRatio: 2),
                delegate: SliverChildBuilderDelegate((ctx, index) {
                  return CollectionGridCardView(collection: collections[index]);
                }, childCount: collections.length),
              ),
            )
          ],
        ),
      ),
    );
  }
}
