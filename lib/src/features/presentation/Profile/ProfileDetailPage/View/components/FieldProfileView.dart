// ignore_for_file: must_be_immutable, unnecessary_nullable_for_final_variable_declarations, file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/MainCordinator/MainCordinator.dart';

import '../../../../../../base/Views/BaseView.dart';
import '../../../../../../utils/Styles/BoxShadowDecoration.dart';
import '../../../../../domain/Entities/User/UserEntity.dart';
import '../../../../Shared/Components/TextFormField/CustomTextFormFields.dart';

mixin FieldsProfileDetailViewDelegate {
  userDataChanged({required UserEntity? newUser});
}

class FieldsProfileDetailView extends StatelessWidget
    with TextFormFieldDelegate, BaseView {
  final Decoration? _decoration = borderSideNoneDecoration;
  final UserEntity? userData;
  final FieldsProfileDetailViewDelegate? delegate;

  FieldsProfileDetailView(
      {super.key, required this.userData, required this.delegate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: CustomTextFormField(
              delegate: this,
              hintext: 'Username',
              textFormFieldType: CustomTextFormFieldType.username,
              decoration: _decoration,
              initialValue: userData?.username,
              icon: const Icon(Icons.person_outline, color: naranja),
            ),
          ),
          const Divider(),
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: CustomTextFormField(
              delegate: this,
              hintext: 'Phone',
              textFormFieldType: CustomTextFormFieldType.phone,
              decoration: _decoration,
              initialValue: userData?.phone,
              icon: const Icon(Icons.phone_iphone_outlined, color: naranja),
            ),
          ),
          const Divider(),
          const SizedBox(height: 4),
          userData?.provider == UserAuthProvider.emailAndPassword
              ? _ChangeEmailView()
              : Container(),
          userData?.provider == UserAuthProvider.emailAndPassword
              ? _ChangePasswordView()
              : Container(),
          ListTile(
            leading: const Icon(Icons.credit_card_outlined, color: naranja),
            title: const Text('Change Payment Methods',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w400)),
            trailing: const Icon(Icons.chevron_right, color: gris),
            onTap: () {
              coordinator.showChangePaymentsMethodsPage(context: context);
            },
          ),
          const Divider(),
          ListTile(
              leading:
                  const Icon(Icons.delivery_dining_outlined, color: naranja),
              title: const Text('Change Delivery Address',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400)),
              trailing: const Icon(Icons.chevron_right, color: gris),
              onTap: () {
                coordinator.showChangeDeliveryAddress(context: context);
              }),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.file_copy_outlined, color: naranja),
            title: Text('Billing information',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w400)),
            trailing: Icon(Icons.chevron_right, color: gris),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.privacy_tip_outlined, color: naranja),
            title: Text('Manage Privacy',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w400)),
            trailing: Icon(Icons.chevron_right, color: gris),
          )
        ],
      ),
    );
  }

  @override
  onChanged(
      {required String newValue,
      required CustomTextFormFieldType customTextFormFieldType}) {
    switch (customTextFormFieldType) {
      case CustomTextFormFieldType.username:
        userData?.username = newValue;
        delegate?.userDataChanged(newUser: userData);
        break;
      case CustomTextFormFieldType.phone:
        userData?.phone = newValue;
        delegate?.userDataChanged(newUser: userData);
        break;
      default:
        break;
    }
  }
}

class _ChangeEmailView extends StatelessWidget with BaseView {
  _ChangeEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.email_outlined, color: naranja),
          title: const Text('Change Email',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
          trailing: const Icon(Icons.chevron_right, color: gris),
          onTap: () {
            coordinator.showEditEmailPage(context: context);
          },
        ),
        const Divider()
      ],
    );
  }
}

class _ChangePasswordView extends StatelessWidget with BaseView {
  _ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.lock_outline, color: naranja),
          title: const Text('Change Password',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
          trailing: const Icon(Icons.chevron_right, color: gris),
          onTap: () {
            coordinator.showEditPasswordPage(context: context);
          },
        ),
        const Divider()
      ],
    );
  }
}
