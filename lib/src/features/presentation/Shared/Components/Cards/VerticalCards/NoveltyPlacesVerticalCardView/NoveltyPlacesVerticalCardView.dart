// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/Components/Buttons/RoundedButton/View/RoundedButton.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/MainCordinator/MainCordinator.dart';
import '../../../../../../../Colors/colors.dart';
import '../../../../../../../base/Views/BaseView.dart';
import '../../../../../../../utils/Helpers/DefaultImages/DefaultCardImageUrl.dart';
import '../../../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';

class NoveltyPlacesVerticalCardView extends StatelessWidget with BaseView {
  final PlaceDetailEntity placeListDetailEntity;

  NoveltyPlacesVerticalCardView({Key? key, required this.placeListDetailEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        coordinator.showPlaceDetailPage(
            context: context, place: placeListDetailEntity);
      },
      child: Container(
        width: 220.0,
        margin: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                  width: 210.0,
                  height: 250.0,
                  fit: BoxFit.cover,
                  image: NetworkImage(placeListDetailEntity.imgs?.first ??
                      DefaultCardImageUrlHelper.defaultCardImageUrl)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text(placeListDetailEntity.placeName,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0)),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(placeListDetailEntity.address,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: gris,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0)),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: amarillo, size: 16),
                    Text("${placeListDetailEntity.ratingAverage}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0)),
                    Text("(${placeListDetailEntity.ratings} ratings)",
                        style: const TextStyle(
                            color: gris,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0)),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        width: 80.0,
                        height: 18.0,
                        child: createElevatedButton(
                            shape: const StadiumBorder(),
                            color: naranja,
                            labelColor: white,
                            labelButton: 'Delivery',
                            labelFontSize: 11.0))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
