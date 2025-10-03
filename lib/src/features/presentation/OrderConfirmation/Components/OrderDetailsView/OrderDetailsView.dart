// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';
import 'package:flutter_application_test/src/utils/Extensions/Iterable/IterableExtension.dart';

import '../../../../../utils/Styles/BoxShadowDecoration.dart';
import '../../../../domain/Entities/Order/OrderEntity.dart';
import '../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../../../Shared/Components/ProductSelectedCardView/Model/ProductSelectedCardModel.dart';
import '../../../Shared/Components/ProductSelectedCardView/View/ProductSelectedCardView.dart';

class OrderDetailsView extends StatefulWidget {
  final OrderEntity order;
  ProductSelectedCardViewDelegate delegate;

  OrderDetailsView({Key? key, required this.order, required this.delegate})
      : super(key: key);

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          decoration: getBoxDecorationWithShadows(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PlaceNameView(order: widget.order),
              _PlaceLocationView(order: widget.order),
              _ProductsInOrderView(
                  order: widget.order, delegate: widget.delegate)
            ],
          ),
        )
      ],
    );
  }
}

class _PlaceNameView extends StatelessWidget {
  final OrderEntity order;

  const _PlaceNameView({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 16, top: 16),
        child: Text(order.place.placeName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)));
  }
}

class _PlaceLocationView extends StatelessWidget {
  final OrderEntity order;

  const _PlaceLocationView({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 16, top: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.location_on,
              color: gris,
              size: 16,
            ),
            Container(
              margin: const EdgeInsets.only(left: 4),
              width: 320,
              child: Text(order.place.address,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500, color: gris)),
            )
          ],
        ));
  }
}

class _ProductsInOrderView extends StatelessWidget {
  final OrderEntity order;
  ProductSelectedCardViewDelegate delegate;

  _ProductsInOrderView({Key? key, required this.order, required this.delegate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
        child: Column(children: _getProductCardsViews()));
  }

  List<Widget> _getProductCardsViews() {
    return order.products.map((product) {
      return ProductSelectedCardView(
          model: ProductSelectedCardModel(
              id: product.id,
              photoUrl: product.imgs.first,
              price: product.productPrice,
              quantity: _getAmountOfProductInOrder(productId: product.id),
              productName: product.productName,
              extras: _getExtrasFrom(options: product.options)),
          isTheLastProduct: product == order.products.last,
          delegate: delegate);
    }).toList();
  }

  int _getAmountOfProductInOrder({required String productId}) {
    return order.products
        .where((productOrdered) => productOrdered.id == productId)
        .first
        .amount;
  }

  String _getExtrasFrom({required List<PlaceProductExtrasEntity> options}) {
    var extrasJoined = "";
    for (var option in options) {
      extrasJoined = option.extras
          .map((extra) {
            if (extra.isSelected) {
              return extra.title;
            }
          })
          .compactMap()
          .join(", ");
    }
    return extrasJoined;
  }
}
