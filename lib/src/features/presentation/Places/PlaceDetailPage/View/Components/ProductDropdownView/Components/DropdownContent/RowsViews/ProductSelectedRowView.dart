// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import '../../../../../../../../../../Colors/colors.dart';
import '../../../../../../../../../../utils/Helpers/Checkout/CheckoutHelper.dart';
import '../../../../../../../../../../utils/Helpers/ScreenSize/screen_size_helper.dart';
import '../../../../../../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../../../../../../ViewModel/PlaceDetailViewModel.dart';

class ProductSelectedRowView extends StatefulWidget {
  PlaceProductEntity product;
  PlaceDetailViewModel viewModel;

  ProductSelectedRowView(
      {Key? key, required this.product, required this.viewModel})
      : super(key: key);

  @override
  State<ProductSelectedRowView> createState() => _ProductSelectedRowViewState();
}

class _ProductSelectedRowViewState extends State<ProductSelectedRowView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        FirstRow(
            quantity: widget.viewModel
                .getAmountOfProductInOrder(productId: widget.product.id),
            productPrice:
                CheckoutHelper.formatPriceInEuros(widget.product.productPrice)),
        Container(
            margin: const EdgeInsets.only(top: 6),
            child: SecondRow(
                productName: widget.product.productName,
                extras: widget.product.getExtras())),
        ThirdRow(viewModel: widget.viewModel, product: widget.product)
      ],
    );
  }
}

class FirstRow extends StatelessWidget {
  final int quantity;
  final String productPrice;

  FirstRow({Key? key, required this.quantity, required this.productPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(productPrice,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500)),
        Text("${quantity}x",
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class SecondRow extends StatelessWidget {
  final String productName;
  final String extras;

  const SecondRow({Key? key, required this.productName, required this.extras})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(productName,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black)),
        extras.isEmpty
            ? Container()
            : Container(
                width: getScreenWidth(context: context),
                margin: const EdgeInsets.only(top: 5),
                child: Text(extras,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.black87)),
              )
      ],
    );
  }
}

class ThirdRow extends StatelessWidget {
  PlaceProductEntity product;
  PlaceDetailViewModel viewModel;

  ThirdRow({Key? key, required this.viewModel, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            icon: const Icon(
              Icons.remove_circle,
              color: naranja,
              size: 24,
            ),
            onPressed: () {
              viewModel.updateAmountToProductInOrder(
                  productId: product.id, amount: -1);
            }),
        IconButton(
            icon: const Icon(
              Icons.add_circle,
              color: naranja,
              size: 24,
            ),
            onPressed: () {
              viewModel.updateAmountToProductInOrder(
                  productId: product.id, amount: 1);
            })
      ],
    );
  }
}
