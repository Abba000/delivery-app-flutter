// ignore_for_file: avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/MainCordinator/MainCordinator.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/user_state_provider.dart';
import '../../../../../Colors/Colors.dart';
import '../../../../../base/Views/BaseView.dart';
import '../../../../domain/Entities/DeliveryAddress/DeliveryAddressEntity.dart';
import '../../../Error/ErrorAlertView.dart';
import '../../../Places/PlaceDetailPage/View/Components/FABPlaceDetailView/FABPlaceDetailView.dart';
import '../../../Shared/Components/BackButtons/BackButtonView/View/BackButtonView.dart';
import 'Components/ChangeDeliveryAddressContentView.dart';

class ChangeDeliveryAddressPage extends StatefulWidget {
  const ChangeDeliveryAddressPage({Key? key}) : super(key: key);

  @override
  State<ChangeDeliveryAddressPage> createState() =>
      _ChangeDeliveryAddressPageState();
}

class _ChangeDeliveryAddressPageState extends State<ChangeDeliveryAddressPage>
    with BaseView, BaseViewStateDelegate {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FABRoundedRectangleView(
          text: 'Add New Address',
          backgroundColor: naranja,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          onPressed: () {
            coordinator.showAddEditDeliveryAddress(
                context: context, viewStateDelegate: this, isForEditing: false);
          },
          isHidden: false),
      appBar: AppBar(
          title: const Text("Address Book",
              style: TextStyle(fontSize: 17, color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 0.4,
          leading: Builder(
            builder: (BuildContext context) {
              return const BackButtonView(color: Colors.black);
            },
          )),
      body: FutureBuilder(
          future: (context).getDeliveryAddressList(),
          builder: (BuildContext context,
              AsyncSnapshot<DeliveryAddressListEntity?> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return loadingView;
              case ConnectionState.done:
                if (snapshot.hasData && snapshot.data != null) {
                  return ChangeDeliveryAddressContentView(
                      deliveryAddressEntity: snapshot.data,
                      viewStateDelegate: this);
                } else {
                  return ErrorView();
                }
              default:
                return loadingView;
            }
          }),
    );
  }

  @override
  void onChange() {
    print("onChange ++++++++++");
    setState(() {});
  }
}
