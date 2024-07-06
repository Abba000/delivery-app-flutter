// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/base/Views/BaseView.dart';
import 'package:flutter_application_test/src/colors/colors.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/BackButtons/back_button.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Buttons/rounded_button.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Headers/header_text.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/TextFormFields/CustomTextFormField.dart';
import 'package:flutter_application_test/src/features/presentation/Auth/sign_up_page/ViewModel/SignUpViewModel.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';

class SignUpPage extends StatelessWidget with BaseView {
  //DEPENDENCIAS
  final SignUpViewModel viewModel;

  // ignore: use_key_in_widget_constructors
  SignUpPage({SignUpViewModel? viewModel})
      : viewModel = viewModel ?? DefaultSignUpViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(builder: (BuildContext context) {
          return backButton(context, Colors.black);
        }),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Center(
                child: Form(
                  key: viewModel.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        headerText(
                          texto: 'Create an account',
                          color: primaryColor,
                          fontSize: 30.0,
                        ), // Este es el fontSize

                        const SizedBox(height: 20.0),

                        CustomTextFormField(
                          textFormFieldType: CustomTextFormFieldType.username,
                          hintext: 'Username',
                          delegate: viewModel,
                        ),
                        CustomTextFormField(
                          textFormFieldType: CustomTextFormFieldType.email,
                          hintext: 'Email',
                          delegate: viewModel,
                        ),
                        CustomTextFormField(
                          textFormFieldType: CustomTextFormFieldType.phone,
                          hintext: 'Phone',
                          delegate: viewModel,
                        ),
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: AbsorbPointer(
                            child: CustomTextFormField(
                              textFormFieldType:
                                  CustomTextFormFieldType.dateOfBirth,
                              hintext: 'Date of Birth',
                              delegate: viewModel,
                              controller: viewModel.dateController,
                            ),
                          ),
                        ),
                        CustomTextFormField(
                          textFormFieldType: CustomTextFormFieldType.password,
                          hintext: 'Password',
                          delegate: viewModel,
                        ),

                        createElevatedButton(
                          color: naranja,
                          labelButton: 'Sign Up',
                          func: () {
                            _ctaTapped(context);
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 40.0),
                          child: const Text(
                            'By clicking Sign Up you agree to the following Terms and Condition without reservation',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

extension UserActions on SignUpPage {
  void _ctaTapped(BuildContext context) {
    if (viewModel.isFormValidate()) {
      viewModel.signUp().then((result) {
        switch (result.status) {
          case ResultStatus.success:
            Navigator.pushNamed(context, "tabs");
            break;
          case ResultStatus.error:
            // Manejar el error aquí
            break;
        }
      });
    }
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: viewModel.selectedDate,
      firstDate: DateTime(1960, 1),
      lastDate: DateTime(2100),
      locale: const Locale('es', ''),
    );

    if (picked != null && picked != viewModel.selectedDate) {
      viewModel.signUpModel?.date =
          "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
      viewModel.dateController.text =
          "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
    }
  }
}
