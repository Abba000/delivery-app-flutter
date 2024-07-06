// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/MainCordinator/MainCordinator.dart';

import '../../../../../../base/Views/BaseView.dart';
import '../../../../../../utils/Helpers/DefaultImages/DefaultCardImageUrl.dart';
import '../../../../../domain/Entities/Collections/CollectionsEntity.dart';

class CollectionCardView extends StatelessWidget with BaseView {
  // Dependencies
  CollectionDetailEntity collection;

  CollectionCardView({Key? key, required this.collection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              coordinator.showCollectionsDetailPage(
                  context: context, collection: collection);
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image(
                    width: 300,
                    height: 150,
                    fit: BoxFit.cover,
                    image: NetworkImage(collection?.img ??
                        DefaultCardImageUrlHelper.defaultCardImageUrl),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(20.0)),
                  width: 300,
                  height: 150,
                  child: Center(
                      child: Text(collection.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
