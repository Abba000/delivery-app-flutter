// ignore_for_file: file_names, must_be_immutable, annotate_overrides, overridden_fields

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/MainCordinator/MainCordinator.dart';

import '../../../../../../base/Views/BaseView.dart';
import '../../../../../../utils/Helpers/ScreenSize/screen_size_helper.dart';
import '../../../../../../utils/Styles/BoxShadowDecoration.dart';
import '../../../../../domain/Entities/DeliveryAddress/DeliveryAddressEntity.dart';
import 'DeliveryAddressListView.dart';

class ChangeDeliveryAddressContentView extends StatelessWidget
    with DeliveryAddressViewDelegate, BaseView {
  DeliveryAddressListEntity? deliveryAddressEntity;
  BaseViewStateDelegate? viewStateDelegate;

  ChangeDeliveryAddressContentView(
      {Key? key, this.deliveryAddressEntity, this.viewStateDelegate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          const SizedBox(height: 16),
          deliveryAddressEntity?.hasDeliveryAddress() ?? false
              ? Container(
                  decoration: getBoxDecorationWithShadows(),
                  width: getScreenWidth(context: context),
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      DeliveryAddressListView(
                          delegate: this,
                          deliveryAddressListEntity: deliveryAddressEntity,
                          viewStateDelegate: viewStateDelegate)
                    ],
                  ),
                )
              : Container()
        ]))
      ],
    );
  }

  @override
  cardTapped(
      {required BuildContext context,
      required DeliveryAddressEntity deliveryAddressEntity}) {
    coordinator.showAddEditDeliveryAddress(
        context: context,
        isForEditing: true,
        deliveryAddressEntity: deliveryAddressEntity,
        viewStateDelegate: viewStateDelegate);
  }
}
