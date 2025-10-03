// ignore_for_file: library_private_types_in_public_api, unused_element, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/MainCordinator/MainCordinator.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/user_state_provider.dart';

import '../../../../base/Views/BaseView.dart';
import '../../../../colors/colors.dart';
import '../../../../utils/Helpers/Checkout/CheckoutHelper.dart';
import '../../../domain/Entities/Order/OrderEntity.dart';
import '../../Places/PlaceDetailPage/View/Components/FABPlaceDetailView/FABPlaceDetailView.dart';
import '../../Shared/Components/Alerts/AlertView/Model/AlertViewModel.dart';
import '../../Shared/Components/Alerts/AlertView/View/AlertView.dart';
import '../../Shared/Components/BackButtons/BackButtonView/View/BackButtonView.dart';
import '../../Shared/Components/ProductSelectedCardView/View/ProductSelectedCardView.dart';
import '../../Shared/Components/Texts/TextView/View/TextView.dart';
import '../Components/CourierTipView/CourierTipView.dart';
import '../Components/DeliveryAddressAndPaymentMethodsView/DeliveryAddressAndPaymentMethodsView.dart';
import '../Components/CourierTipView/Components/TipView.dart';
import '../Components/DeliveryDetailsView/DeliveryDetailsView.dart';
import '../Components/OrderDetailsView/OrderDetailsView.dart';
import '../Components/SummaryView/SummaryView.dart';
import '../Models/CourierTipModel.dart';

class OrderConfirmationPage extends StatefulWidget {
  OrderEntity order;

  OrderConfirmationPage({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage>
    with
        ProductSelectedCardViewDelegate,
        CourierTipViewDelegate,
        DeliveryDetailsViewDelegate,
        BaseViewStateDelegate,
        BaseView {
  @override
  Widget build(BuildContext context) {
    _updateDeliveryAddressInOrder(context);
    _updatePaymentMethodInOrder(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        leading: Builder(
          builder: (BuildContext context) {
            return BackButtonView(
                color: Colors.black,
                onPressed: () => Navigator.pop(context, widget.order));
          },
        ),
        backgroundColor: white,
        title: const TextView(
            texto: 'Order Confirmation',
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FABRoundedRectangleView(
          text: 'Confirm Order',
          onPressed: () {
            // Todo: Create feature for confirm order
          },
          isHidden: false,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            OrderDetailsView(order: widget.order, delegate: this),
            DeliveryAddressAndPaymentMethodsView(viewStateDelegate: this),
            CourierTipView(delegate: this),
            DeliveryDetailsView(order: widget.order, delegate: this),
            SummaryView(order: widget.order),
            const SizedBox(height: 100)
          ]))
        ],
      ),
    );
  }

  @override
  updateAmount({required String productId, required int amount}) {
    List<ProductOrderEntity> products = widget.order.products.map((product) {
      var newProduct = product;
      if (newProduct.id == productId) {
        newProduct.amount += amount;
      }
      return newProduct;
    }).toList();
    products.removeWhere((product) => product.amount == 0);
    setState(() {
      widget.order.products = products;
      widget.order.updateTotalPrice();

      if (widget.order.products.isEmpty) {
        Navigator.pop(context, widget.order);
      }
    });
  }

  @override
  courierTipChanged({required TipModel model}) {
    setState(() {
      widget.order.courierTip = model.tip;
      widget.order.updateTotalPrice();
    });
  }

  @override
  deliveryDetailsChanged({required OrderEntity order}) {
    setState(() {
      widget.order = order;
    });
  }

  @override
  void onChange() {
    setState(() {});
  }
}

extension PrivateMethods on _OrderConfirmationPageState {
  Future<void> _updateDeliveryAddressInOrder(BuildContext context) async {
    var deliveryAddress = await (context).getDeliveryAddressList();
    if (deliveryAddress == null) {
      return;
    }
    widget.order.deliveryAddress =
        CheckoutHelper.getMainDeliveryAddress(entity: deliveryAddress)
            .deliveryAddressList
            .first;
  }

  Future<void> _updatePaymentMethodInOrder(BuildContext context) async {
    var paymentMethods = await (context).getPaymentMethods();
    if (paymentMethods == null) {
      return;
    }
    widget.order.paymentMethod =
        CheckoutHelper.getMainPaymentMethods(entity: paymentMethods)
            .paymentMethods
            .first;
  }
}

extension AlertsMethods on _OrderConfirmationPageState {
  _showPurchaseSuccessAlert(BuildContext context) {
    AlertView.showAlertDialog(
        model: AlertViewModel(
            context,
            const AssetImage('assets/check_order.png'),
            "Your order is successfully.",
            'You can track the delivery in the "Orders" section.',
            "Continue Shopping",
            "Go to orders", () {
      // Cta Action
      coordinator.showTabsPage(context: context);
    }, () {
      // Subtitle Action
      coordinator.showTabsPage(context: context, selectedTab: 1);
    }));
  }

  _showFailureSuccessAlert(BuildContext context) {
    AlertView.showAlertDialog(
        model: AlertViewModel(
            context,
            const AssetImage('assets/errorIcon.png'),
            "Your order has failed.",
            'You can check the selected payment method.',
            "Continue Checkout",
            "Go to orders", () {
      // Cta Action
      AlertView.closeAlertDialog(context);
    }, () {
      // Subtitle Action
      coordinator.showTabsPage(context: context, selectedTab: 1);
    }));
  }
}
