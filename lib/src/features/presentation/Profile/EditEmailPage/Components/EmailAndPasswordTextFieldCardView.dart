// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';
import '../../../../../Utils/Styles/BoxShadowDecoration.dart';
import '../../../../../utils/Helpers/ScreenSize/screen_size_helper.dart';
import '../../../Shared/Components/TextFormField/CustomTextFormFields.dart';

mixin EmailAndPasswordTextFieldCardViewDelegate {
  emailChanged({required String email});
  passwordChanged({required String password});
}

class EmailAndPasswordTextFieldCardView extends StatelessWidget
    with TextFormFieldDelegate {
  Decoration? decoration;
  final EmailAndPasswordTextFieldCardViewDelegate? delegate;
  String title = "";
  EmailAndPasswordTextFieldCardView(
      {Key? key, required this.delegate, required this.title, this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getBoxDecorationWithShadows(),
      width: getScreenWidth(context: context),
      margin: const EdgeInsets.only(left: 16, right: 16),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Text(title,
              style: const TextStyle(fontSize: 15, color: primaryColor)),
          const SizedBox(height: 8),
          CustomTextFormField(
              delegate: this,
              hintext: 'Email',
              textFormFieldType: CustomTextFormFieldType.email,
              decoration: decoration ?? defaultTextFieldDecoration),
          const SizedBox(height: 8),
          CustomTextFormField(
            delegate: this,
            hintext: 'Password',
            textFormFieldType: CustomTextFormFieldType.password,
            decoration: defaultTextFieldDecoration,
          ),
          const SizedBox(height: 8)
        ],
      ),
    );
  }

  @override
  onChanged(
      {required String newValue,
      required CustomTextFormFieldType customTextFormFieldType}) {
    switch (customTextFormFieldType) {
      case CustomTextFormFieldType.email:
        delegate?.emailChanged(email: newValue);
        break;
      case CustomTextFormFieldType.password:
        delegate?.passwordChanged(password: newValue);
        break;
      default:
        break;
    }
  }
}
