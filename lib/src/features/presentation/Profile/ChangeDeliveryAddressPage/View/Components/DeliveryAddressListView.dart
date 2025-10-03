// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/ErrorStateProvider.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/LoadingStatusProvider.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/user_state_provider.dart';

import '../../../../../../base/Constants/ErrorMessage.dart';
import '../../../../../../base/Views/BaseView.dart';
import '../../../../../../utils/Styles/BoxShadowDecoration.dart';
import '../../../../../domain/Entities/DeliveryAddress/DeliveryAddressEntity.dart';
import '../../../../Shared/Components/TextFormField/CustomTextFormFields.dart';

mixin DeliveryAddressViewDelegate {
  cardTapped(
      {required BuildContext context,
      required DeliveryAddressEntity deliveryAddressEntity});
}

class DeliveryAddressListView extends StatefulWidget {
  final DeliveryAddressViewDelegate? delegate;
  final DeliveryAddressListEntity? deliveryAddressListEntity;
  final BaseViewStateDelegate? viewStateDelegate;

  const DeliveryAddressListView(
      {Key? key,
      required this.delegate,
      required this.deliveryAddressListEntity,
      required this.viewStateDelegate})
      : super(key: key);

  @override
  State<DeliveryAddressListView> createState() =>
      _DeliveryAddressListViewState();
}

class _DeliveryAddressListViewState extends State<DeliveryAddressListView>
    with TextFormFieldDelegate {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _getDeliveryAddressWidgetList(context),
    );
  }

  List<Widget> _getDeliveryAddressWidgetList(BuildContext context) {
    if (widget.deliveryAddressListEntity == null) {
      return [];
    }
    if (widget.deliveryAddressListEntity!.deliveryAddressList.isEmpty) {
      return [];
    }

    return widget.deliveryAddressListEntity?.deliveryAddressList
            .map((deliveryAddressEntity) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  widget.delegate?.cardTapped(
                      context: context,
                      deliveryAddressEntity: deliveryAddressEntity);
                },
                child: CustomTextFormField(
                  delegate: this,
                  hintext: '',
                  textFormFieldType: CustomTextFormFieldType.email,
                  decoration: deliveryAddressEntity.isMainDeliveryAddress
                      ? defaultTextFieldDecoration
                      : borderGrayDecoration,
                  labelValue: deliveryAddressEntity.alias.toUpperCase(),
                  initialValue: deliveryAddressEntity.street,
                  enabled: false,
                ),
              ),
              deliveryAddressEntity.isMainDeliveryAddress
                  ? Container()
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.deliveryAddressListEntity
                              ?.updateMainDeliveryAddress(
                                  id: deliveryAddressEntity.id);
                          _editDeliveryAddress();
                        });
                      },
                      child: Container(
                          margin: const EdgeInsets.only(top: 6),
                          child: const Text("Mark as primary",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: rosa))),
                    )
            ],
          );
        }).toList() ??
        [];
  }

  @override
  onChanged(
      {required String newValue,
      required CustomTextFormFieldType customTextFormFieldType}) {}

  _editDeliveryAddress() {
    if (widget.deliveryAddressListEntity == null) {
      return;
    }

    (context)
        .saveAllDeliveryAddress(parameters: widget.deliveryAddressListEntity!)
        .then((_) {
      setState(() {
        (context).setLoadingState(isLoading: false);
      });
    }, onError: (_) {
      (context).showErrorAlert(
          message: AppFailureMessages.unExpectedErrorMessage, context: context);
    });
  }
}
