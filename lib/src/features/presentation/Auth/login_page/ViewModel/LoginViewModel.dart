// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/base/ApiService/AppError.dart';
import 'package:flutter_application_test/src/base/Constants/LocalStorageKey.dart';
import 'package:flutter_application_test/src/base/Views/BaseView.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/Auth/SignInUseCase/SignInUseCase.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/Auth/SignInUseCase/SignInUseCaseBodyParameters.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/LocalStorage/SaveLocalStorageUseCase.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/LoadingStatusProvider.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/TextFormFields/CustomTextFormField.dart';
import 'package:flutter_application_test/src/features/presentation/Auth/login_page/Model/LoginModel.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';

abstract class LoginViewModelInput {
  // Exposed properties
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginModel? loginModel = LoginModel(email: '', password: '');
  // Exposed Methods
  Future<Result<bool, Failure>> login(
      {required String email, required String password});
  bool isFormValidate();
}

// * LoginViewModel
abstract class LoginViewModel extends LoginViewModelInput
    with TextFormFieldDelegate, BaseViewModel {}

class DefaultLoginViewModel extends LoginViewModel {
  // * Dependencies
  // * UseCases
  final SignInUseCase _signInUseCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  // * Constructor
  DefaultLoginViewModel(
      {SignInUseCase? signInUseCase,
      SaveLocalStorageUseCase? saveLocalStorageUseCase})
      : _signInUseCase = signInUseCase ?? DefaultSignInUseCase(),
        _saveLocalStorageUseCase =
            saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  // * Init State
  @override
  void initState({required LoadingStateProvider loadingState}) {
    loadingStatusState = loadingState;
  }

  // User Actions
  @override
  Future<Result<bool, Failure>> login(
      {required String email, required String password}) {
    loadingStatusState.setLoadingState(isLoading: true);

    return _signInUseCase
        .execute(
            params: SignInUseCaseParameters(email: email, password: password))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          _saveLocalStorageUseCase.execute(
              saveLocalParameteres: SaveLocalStorageParameters(
                  key: LocalStorageKeys.idToken,
                  value: result.value?.localId ?? ""));
          loadingStatusState.setLoadingState(isLoading: false);
          return Result.success(true);
        case ResultStatus.error:
          loadingStatusState.setLoadingState(isLoading: false);
          return Result.failure(result.error);
      }
    });
  }

  // Utils
  @override
  bool isFormValidate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  onChanged(
      {required String newValue,
      required CustomTextFormFieldType customTextFormFieldType}) {
    switch (customTextFormFieldType) {
      case CustomTextFormFieldType.email:
        loginModel?.email = newValue;
        break;
      case CustomTextFormFieldType.password:
        loginModel?.password = newValue;
        break;
      case CustomTextFormFieldType.username:
        break;
      case CustomTextFormFieldType.phone:
        break;
      case CustomTextFormFieldType.dateOfBirth:
        break;
      default:
        break;
    }
  }
}
