// ignore_for_file: file_names

import '../Collections/CollectionsEntity.dart';

class FiltersModelEntity {
  // COLLECTION BOOLEANS
  CollectionDetailEntity? collectionSelected;

  // SORT BY BOOLEANS
  bool mostPopular = false;
  bool costHighToLow = false;
  bool costLowToHigh = false;

  // FILTER BOOLEANS
  bool openNow = false;
  bool alcoholServed = false;

  double maxPriceSelected = 0.0;

  resetFilters() {
    collectionSelected = null;
    mostPopular = false;
    costHighToLow = false;
    costLowToHigh = false;
    openNow = false;
    alcoholServed = false;
    maxPriceSelected = 0.0;
  }

  bool isNothingSelected() {
    if (mostPopular == false &&
        costHighToLow == false &&
        costLowToHigh == false &&
        openNow == false &&
        alcoholServed == false &&
        collectionSelected == null &&
        maxPriceSelected == 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
