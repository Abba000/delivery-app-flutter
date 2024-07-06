// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

import '../../../../../../../../../../Colors/Colors.dart';
import '../../../../../../../../../../utils/Helpers/Checkout/CheckoutHelper.dart';
import '../../../../../../../../../../utils/Helpers/ScreenSize/screen_size_helper.dart';
import '../../../../../../../../../domain/Entities/Places/PlacesListEntity/PlacesListEntity.dart';
import '../../../../../../../../Shared/commons_widgets/Texts/TextView/View/TextView.dart';
import '../../../../../../ViewModel/PlaceDetailViewModel.dart';
import '../../ProductDetail/ProductDetail.dart';

class ProductUnSelectedRowView extends StatefulWidget {
  PlaceProductEntity product;
  PlaceDetailViewModel viewModel;

  ProductUnSelectedRowView(
      {Key? key, required this.product, required this.viewModel})
      : super(key: key);

  @override
  State<ProductUnSelectedRowView> createState() =>
      _ProductUnSelectedRowViewState();
}

class _ProductUnSelectedRowViewState extends State<ProductUnSelectedRowView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showProductDetailView(),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: getScreenWidth(context: context, multiplier: 0.75),
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  widget.product.productName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: TextView(
                    texto: CheckoutHelper.formatPriceInEuros(
                        widget.product.productPrice),
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                    color: Colors.black),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: getScreenWidth(context: context, multiplier: 0.79),
                child: Text(
                  widget.product.productDescription,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 12),
                ),
              ),
              IconButton(
                  icon: const Icon(
                    Icons.add_circle,
                    color: naranja,
                    size: 24,
                  ),
                  onPressed: () {})
            ],
          )
        ],
      ),
    );
  }

  void _showProductDetailView() {
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        builder: (context) {
          return ProductDetailView(
              product: widget.product, viewModel: widget.viewModel);
        });
  }
}
