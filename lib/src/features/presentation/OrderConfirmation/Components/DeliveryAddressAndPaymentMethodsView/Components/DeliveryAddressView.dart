// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/MainCordinator/MainCordinator.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/user_state_provider.dart';

import '../../../../../../base/Views/BaseView.dart';
import '../../../../../../utils/Helpers/Checkout/CheckoutHelper.dart';
import '../../../../../domain/Entities/DeliveryAddress/DeliveryAddressEntity.dart';
import '../../../../Profile/ChangeDeliveryAddressPage/View/Components/DeliveryAddressListView.dart';

class DeliveryAddressView extends StatefulWidget {
  final BaseViewStateDelegate? viewStateDelegate;

  const DeliveryAddressView({Key? key, this.viewStateDelegate})
      : super(key: key);

  @override
  State<DeliveryAddressView> createState() => _DeliveryAddressViewState();
}

class _DeliveryAddressViewState extends State<DeliveryAddressView>
    with BaseView, DeliveryAddressViewDelegate, BaseViewStateDelegate {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: (context).getDeliveryAddressList(),
      builder: (BuildContext context,
          AsyncSnapshot<DeliveryAddressListEntity?> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          if (CheckoutHelper.getMainDeliveryAddress(entity: snapshot.data!)
              .deliveryAddressList
              .isEmpty) {
            return Container();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 16, top: 16),
                  child: const Text("DELIVERY ADDRESS",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold))),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: DeliveryAddressListView(
                    delegate: this,
                    deliveryAddressListEntity:
                        CheckoutHelper.getMainDeliveryAddress(
                            entity: snapshot.data!),
                    viewStateDelegate: this),
              ),
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      coordinator
                          .showChangeDeliveryAddress(context: context)
                          .then((value) {
                        setState(() {
                          widget.viewStateDelegate?.onChange();
                        });
                      });
                    },
                    child: Container(
                        margin: const EdgeInsets.only(right: 16, top: 16),
                        child: const Text("Edit shipping address",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: rosa))),
                  )
                ],
              )
            ],
          );
        } else {
          return Container(color: Colors.white);
        }
      },
    );
  }

  @override
  cardTapped(
      {required BuildContext context,
      required DeliveryAddressEntity deliveryAddressEntity}) {}

  @override
  void onChange() {}
}
