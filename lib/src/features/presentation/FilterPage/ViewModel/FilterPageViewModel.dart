// ignore_for_file: file_names

import '../../../domain/Entities/Collections/CollectionsEntity.dart';
import '../../../domain/Entities/Places/FiltersModelEntity.dart';
import '../../../domain/UseCases/Collections/FetchCollectionsUseCase.dart';

enum FilterPageViewModelState { viewLoadedState, errorState }

abstract class FilterPageViewModelInput {
  Future<FilterPageViewModelState> viewInitState();
  List<CollectionDetailEntity> collections = [];
  FiltersModelEntity filtersModel = FiltersModelEntity();
}

abstract class FilterPageViewModel extends FilterPageViewModelInput {}

class DefaultFilterPageViewModel extends FilterPageViewModel {
  final FetchCollectionUseCase _fetchCollectionUseCase;

  DefaultFilterPageViewModel({FetchCollectionUseCase? fetchCollectionUseCase})
      : _fetchCollectionUseCase =
            fetchCollectionUseCase ?? DefaultFetchCollectionUseCase();

  @override
  Future<FilterPageViewModelState> viewInitState() async {
    final collectionsResponse = await _fetchCollectionUseCase.execute();
    collections = collectionsResponse.collections ?? [];

    if (collections.isNotEmpty) {
      return FilterPageViewModelState.viewLoadedState;
    } else {
      return FilterPageViewModelState.errorState;
    }
  }
}
