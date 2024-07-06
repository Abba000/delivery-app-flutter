// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';
import 'package:flutter_application_test/src/utils/Helpers/Validators/FormValidator.dart';

mixin TextFormFieldDelegate {
  onChanged(
      {required String newValue,
      required CustomTextFormFieldType customTextFormFieldType});
}

enum CustomTextFormFieldType { email, password, phone, username, dateOfBirth }

class CustomTextFormField extends StatelessWidget {
  final TextFormFieldDelegate delegate;
  final CustomTextFormFieldType textFormFieldType;
  final String hintext;
  final TextEditingController? controller;

  const CustomTextFormField(
      {Key? key,
      required this.delegate,
      required this.textFormFieldType,
      required this.hintext,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
          color: bgInput, borderRadius: BorderRadius.circular(40.0)),
      child: TextFormField(
        controller: controller,
        keyboardType: getKeyboardType(textFormFieldType: textFormFieldType),
        obscureText: textFormFieldType == CustomTextFormFieldType.password
            ? true
            : false,
        decoration: InputDecoration(
            hintText: hintext,
            border: const OutlineInputBorder(borderSide: BorderSide.none)),
        onChanged: (newValue) => delegate.onChanged(
            newValue: newValue, customTextFormFieldType: textFormFieldType),
        validator: (value) {
          switch (textFormFieldType) {
            case CustomTextFormFieldType.email:
              return EmailFormValidator.validateEmail(email: value ?? '');

            case CustomTextFormFieldType.password:
              return PasswordFormValidator.validatePassword(
                  password: value ?? '');

            case CustomTextFormFieldType.username:
              return DefaultFormValidator.validateIsNotEmpty(
                  value: value ?? '');

            case CustomTextFormFieldType.phone:
              return DefaultFormValidator.validateIsNotEmpty(
                  value: value ?? '');
            case CustomTextFormFieldType.dateOfBirth:
              break;
          }
          return null;
        },
      ),
    );
  }

  TextInputType? getKeyboardType(
      {required CustomTextFormFieldType textFormFieldType}) {
    switch (textFormFieldType) {
      case CustomTextFormFieldType.email:
        return TextInputType.emailAddress;
      case CustomTextFormFieldType.password:
        return TextInputType.visiblePassword;
      case CustomTextFormFieldType.username:
        return TextInputType.text;
      case CustomTextFormFieldType.phone:
        return TextInputType.phone;
      case CustomTextFormFieldType.dateOfBirth:
        break;
    }
    return null;
  }
}
