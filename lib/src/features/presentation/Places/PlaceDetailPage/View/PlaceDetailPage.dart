// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/base/Views/BaseView.dart';
import 'package:flutter_application_test/src/features/presentation/Error/ErrorAlertView.dart';
import 'package:flutter_application_test/src/features/presentation/Places/PlaceDetailPage/View/Components/FABPlaceDetailView/FABPlaceDetailView.dart';
import 'package:flutter_application_test/src/features/presentation/Places/PlaceDetailPage/View/Components/ProductDropdownView/Components/AppBarView/AppBarView.dart';
import 'package:flutter_application_test/src/features/presentation/Places/PlaceDetailPage/View/Components/ProductDropdownView/Components/DropdownContent/DropDownsView.dart';
import 'package:flutter_application_test/src/features/presentation/Places/PlaceDetailPage/ViewModel/PlaceDetailViewModel.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/MainCordinator/MainCordinator.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Texts/DoubleTextView/View/DoubleTextView.dart';

import '../../../../../utils/Helpers/Checkout/CheckoutHelper.dart';
import '../../../../domain/Entities/Order/OrderEntity.dart';
import '../../../Shared/Components/RatingsView/RatingsView.dart';
import '../../../Shared/Components/RatingsView/YourRatingView.dart';

class PlaceDetailPage extends StatefulWidget {
  PlaceDetailViewModel viewModel;

  PlaceDetailPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<PlaceDetailPage> createState() => _PlaceDetailPageState();
}

class _PlaceDetailPageState extends State<PlaceDetailPage> with BaseView {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.viewModel.orderStream,
      builder: (BuildContext context, AsyncSnapshot<OrderEntity> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return loadingView;
          default:
            if (snapshot.data != null) {
              return Scaffold(
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: FABRoundedRectangleView(
                    text:
                        'Pedir ${snapshot.data?.products.length} por ${CheckoutHelper.formatPriceInEuros(snapshot.data?.totalAmount ?? 0.0)}',
                    onPressed: () {
                      coordinator
                          .showOrderConfimationPage(
                              context: context, order: snapshot.data!)
                          .then((order) {
                        if (order != null && order is OrderEntity) {
                          widget.viewModel.updateOrder(order: order);
                        }
                      });
                    },
                    isHidden: snapshot.data?.products.isEmpty ?? true),
                body: CustomScrollView(
                  slivers: <Widget>[
                    AppBarView(viewModel: widget.viewModel),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      DropDownsView(viewModel: widget.viewModel),
                      const SizedBox(height: 24.0),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: DoubleTextView(
                            textHeader: "Reviews",
                            textAction: "See All Reviews",
                            textActionTapped: () {
                              coordinator.showRatingsPage(
                                  context: context,
                                  placeRatings:
                                      widget.viewModel.place.placeRatings);
                            }),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: RatingsView(
                            placeRatings: widget.viewModel.place.placeRatings
                                .take(4)
                                .toList()),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: userHasRatingInThisPlace()
                            ? YourRatingView()
                            : Container(),
                      ),
                      const SizedBox(height: 100.0)
                    ]))
                  ],
                ),
              );
            } else {
              return ErrorView();
            }
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.viewModel.dispose();
  }

  bool userHasRatingInThisPlace() {
    String userUid = MainCoordinator.sharedInstance?.userUid ?? "";
    return widget.viewModel.place.placeRatings
        .where((rating) => rating.userId == userUid)
        .toList()
        .isNotEmpty;
  }
}
