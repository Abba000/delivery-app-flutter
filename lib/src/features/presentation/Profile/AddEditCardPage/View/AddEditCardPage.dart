// ignore_for_file: file_names, must_be_immutable, invalid_use_of_protected_member, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/ErrorStateProvider.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/LoadingStatusProvider.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/user_state_provider.dart';
import '../../../../../Colors/Colors.dart';
import '../../../../../Utils/Styles/BoxShadowDecoration.dart';
import '../../../../../base/Constants/ErrorMessage.dart';
import '../../../../../base/Views/BaseView.dart';
import '../../../../../utils/Helpers/Checkout/CheckoutHelper.dart';
import '../../../../../utils/Helpers/Countries/CountriesHelper.dart';
import '../../../../../utils/Helpers/ScreenSize/screen_size_helper.dart';
import '../../../../domain/Entities/PaymentMethods/PaymentMethodsEntity.dart';
import '../../../Places/PlaceDetailPage/View/Components/FABPlaceDetailView/FABPlaceDetailView.dart';
import '../../../Shared/Components/Alerts/AlertView/Model/AlertViewModel.dart';
import '../../../Shared/Components/Alerts/AlertView/View/AlertView.dart';
import '../../../Shared/Components/AppBar/AppBarDoneView.dart';
import '../../../Shared/Components/CountrySelector/CountrySelectorView.dart';
import '../../../Shared/Components/ExpiryDateSelector/ExpiryDateSelectorView.dart';
import '../../../Shared/Components/TextFormField/CustomTextFormFields.dart';

class AddEditCardPage extends StatefulWidget {
  final bool? isEditing;
  final bool? isForCreateAVisaCard;
  PaymentMethodEntity? paymentMethod;
  BaseViewStateDelegate? viewStateDelegate;

  AddEditCardPage(
      {Key? key,
      this.isEditing,
      this.isForCreateAVisaCard,
      this.paymentMethod,
      this.viewStateDelegate})
      : super(key: key);

  @override
  State<AddEditCardPage> createState() => _AddEditCardPageState();
}

class _AddEditCardPageState extends State<AddEditCardPage>
    with
        TextFormFieldDelegate,
        CountrySelectorViewDelegate,
        ExpiryDateSelectorDelegate,
        BaseView {
  String _actionText = "";
  Decoration? _cardNameDecoration = defaultTextFieldDecoration;
  Decoration? _cardNumberDecoration = defaultTextFieldDecoration;
  Decoration? _cardMonthAndYearDecoration = defaultTextFieldDecoration;
  Decoration? _cardCvcDecoration = defaultTextFieldDecoration;
  Decoration? _cardCountryDecoration = defaultTextFieldDecoration;

  final AddEditCardTextEditingControllers _controllers =
      AddEditCardTextEditingControllers();

  @override
  Widget build(BuildContext context) {
    // Si vamos a crear un nuevo método de pago, la property payment method no puede ser nula 😉
    _prepareView();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FABRoundedRectangleView(
          text: 'Delete Card',
          backgroundColor: Colors.red,
          onPressed: () {
            _showAlertDeletePaymentMethod(context);
          },
          isHidden: !_isEditing()),
      appBar: createAppBarDone(
          title: _isEditing() ? "Edit Card" : "Add Card",
          actionText: _actionText,
          onTap: () {
            _editAddCard(context);
          }),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(height: 16),
            Container(
              decoration: getBoxDecorationWithShadows(),
              width: getScreenWidth(context: context),
              margin: const EdgeInsets.only(left: 16, right: 16),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("NAME IN THE CARD",
                      style: TextStyle(
                          fontSize: 14,
                          color: primaryColor,
                          fontWeight: FontWeight.w600)),
                  CustomTextFormField(
                      delegate: this,
                      hintext: 'Name in the Card',
                      textFormFieldType: CustomTextFormFieldType.nameInTheCard,
                      decoration: _cardNameDecoration,
                      initialValue: widget.paymentMethod?.nameInTheCard ?? ""),
                  const SizedBox(height: 16),
                  const Text("CARD NUMBER",
                      style: TextStyle(
                          fontSize: 14,
                          color: primaryColor,
                          fontWeight: FontWeight.w600)),
                  CustomTextFormField(
                    delegate: this,
                    hintext: 'Card Number',
                    textFormFieldType: CustomTextFormFieldType.cardNumber,
                    decoration: _cardNumberDecoration,
                    initialValue: widget.paymentMethod?.cardNumber,
                  ),
                  const SizedBox(height: 16),
                  const Text("MM/YY",
                      style: TextStyle(
                          fontSize: 14,
                          color: primaryColor,
                          fontWeight: FontWeight.w600)),
                  GestureDetector(
                    onTap: () => _showExpiryDateSelectorView(),
                    child: AbsorbPointer(
                      child: CustomTextFormField(
                          delegate: this,
                          hintext: 'MM/YY',
                          textFormFieldType:
                              CustomTextFormFieldType.monthAndYearInCard,
                          decoration: _cardMonthAndYearDecoration,
                          controller: _controllers.monthAndYearController),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text("CVC",
                      style: TextStyle(
                          fontSize: 14,
                          color: primaryColor,
                          fontWeight: FontWeight.w600)),
                  CustomTextFormField(
                    delegate: this,
                    hintext: 'CVC',
                    textFormFieldType: CustomTextFormFieldType.cvc,
                    decoration: _cardCvcDecoration,
                    initialValue: widget.paymentMethod?.cvc ?? "",
                  ),
                  const SizedBox(height: 16),
                  const Text("COUNTRY",
                      style: TextStyle(
                          fontSize: 14,
                          color: primaryColor,
                          fontWeight: FontWeight.w600)),
                  GestureDetector(
                    onTap: () => _showCountrySelectorView(),
                    child: AbsorbPointer(
                      child: CustomTextFormField(
                          delegate: this,
                          hintext: 'Country',
                          textFormFieldType: CustomTextFormFieldType.country,
                          decoration: _cardCountryDecoration,
                          controller: _controllers.countryController),
                    ),
                  ),
                  const SizedBox(height: 16)
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }

  @override
  onChanged(
      {required String newValue,
      required CustomTextFormFieldType customTextFormFieldType}) {
    setState(() {
      switch (customTextFormFieldType) {
        case CustomTextFormFieldType.nameInTheCard:
          widget.paymentMethod?.nameInTheCard = newValue;
          break;
        case CustomTextFormFieldType.cardNumber:
          widget.paymentMethod?.cardNumber = newValue;
          break;
        case CustomTextFormFieldType.cvc:
          widget.paymentMethod?.cvc = newValue;
          break;
        default:
          break;
      }
      _validateForm();
    });
  }

  @override
  onCountrySelected({required Country country}) {
    setState(() {
      widget.paymentMethod?.country = country.name;
      _controllers.countryController.text = country.name;
    });
    _validateForm();
  }

  @override
  void onExpiryDateSelected(String expiryDate) {
    setState(() {
      widget.paymentMethod?.monthAndYear = expiryDate;
      _controllers.monthAndYearController.text = expiryDate;
    });
    _validateForm();
  }

  _pop(BuildContext context) {
    viewStateDelegate?.onChange();
    Navigator.pop(context);
  }
}

extension UserActions on _AddEditCardPageState {
  _editAddCard(BuildContext context) {
    setState(() {
      (context).setLoadingState(isLoading: true);
    });

    if (_isEditing()) {
      // Aquí editamos la tarjeta
      _editCard();
    } else {
      // Aquí creamos la tarjeta
      _addCard();
    }
  }

  _editCard() {
    // Null Check
    if (widget.paymentMethod == null) {
      return;
    }
    (context).editPaymentMethod(paymentMethod: widget.paymentMethod!).then((_) {
      setState(() {
        (context).setLoadingState(isLoading: false);
      });
      _pop(context);
    }, onError: (_) {
      (context).showErrorAlert(
          message: AppFailureMessages.unExpectedErrorMessage, context: context);
    });
  }

  _addCard() {
    // Null Check
    if (widget.paymentMethod == null) {
      return;
    }

    widget.paymentMethod?.type =
        widget.isForCreateAVisaCard ?? false ? "visa" : "mastercard";
    widget.paymentMethod?.id = CheckoutHelper.generateUuid();

    (context).addPaymentMethod(paymentMethod: widget.paymentMethod!).then((_) {
      setState(() {
        (context).setLoadingState(isLoading: false);
      });
      _pop(context);
    }, onError: (_) {
      (context).showErrorAlert(
          message: AppFailureMessages.unExpectedErrorMessage, context: context);
    });
  }

  _deletePaymentMethod(BuildContext context) {
    // Null Check
    if (widget.paymentMethod == null) {
      return;
    }
    setState(() {
      (context).setLoadingState(isLoading: true);
    });

    (context).deletePaymentMethod(paymentMethod: widget.paymentMethod!).then(
        (_) {
      setState(() {
        (context).setLoadingState(isLoading: false);
      });
      _pop(context);
    }, onError: (_) {
      setState(() {
        (context).setLoadingState(isLoading: false);
      });
      _pop(context);
    });
  }

  _showAlertDeletePaymentMethod(BuildContext context) {
    AlertView.showAlertDialog(
        model: AlertViewModel(
            context,
            const AssetImage("assets/errorIcon.png"),
            "",
            "Are you sure to remove this Payment method?",
            "Delete",
            "Cancel", () {
      _deletePaymentMethod(context);
    }, () {
      AlertView.closeAlertDialog(context);
    }));
  }

  void _showCountrySelectorView() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (context) => CountrySelectorView(delegate: this),
    );
  }

  void _showExpiryDateSelectorView() {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        isScrollControlled: true,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.25,
            child: ExpiryDateSelectorView(delegate: this),
          );
        });
  }
}

extension PrivateMethods on _AddEditCardPageState {
  _validateForm() {
    if ((widget.paymentMethod?.nameInTheCard.isEmpty ?? true) ||
        (widget.paymentMethod?.cardNumber.isEmpty ?? true) ||
        (widget.paymentMethod?.monthAndYear.isEmpty ?? true) ||
        (widget.paymentMethod?.cvc.isEmpty ?? true) ||
        (widget.paymentMethod?.country.isEmpty ?? true) ||
        !CheckoutHelper.isValidCardName(
            widget.paymentMethod?.nameInTheCard ?? "") ||
        !CheckoutHelper.isValidCardNumber(
            widget.paymentMethod?.cardNumber ?? "") ||
        !CheckoutHelper.isValidCvc(widget.paymentMethod?.cvc ?? "")) {
      // No es un formulario válido
      _actionText = "";
    } else {
      // Es un formulario válido
      _actionText = "Save";
    }
    _setTextFieldsDecorations();
  }

  _setTextFieldsDecorations() {
    if (!CheckoutHelper.isValidCardName(
        widget.paymentMethod?.nameInTheCard ?? "")) {
      _cardNameDecoration = errorTextFieldDecoration;
    } else {
      _cardNameDecoration = defaultTextFieldDecoration;
    }

    if (!CheckoutHelper.isValidCardNumber(
        widget.paymentMethod?.cardNumber ?? "")) {
      _cardNumberDecoration = errorTextFieldDecoration;
    } else {
      _cardNumberDecoration = defaultTextFieldDecoration;
    }

    if (widget.paymentMethod?.monthAndYear.isEmpty ?? true) {
      _cardMonthAndYearDecoration = errorTextFieldDecoration;
    } else {
      _cardMonthAndYearDecoration = defaultTextFieldDecoration;
    }

    if (!CheckoutHelper.isValidCvc(widget.paymentMethod?.cvc ?? "")) {
      _cardCvcDecoration = errorTextFieldDecoration;
    } else {
      _cardCvcDecoration = defaultTextFieldDecoration;
    }

    if (widget.paymentMethod?.country.isEmpty ?? true) {
      _cardCountryDecoration = errorTextFieldDecoration;
    } else {
      _cardCountryDecoration = defaultTextFieldDecoration;
    }
  }

  bool _isEditing() {
    return widget.isEditing ?? false;
  }

  _prepareView() {
    viewStateDelegate = widget.viewStateDelegate;
    if (!_isEditing() && widget.paymentMethod == null) {
      widget.paymentMethod = PaymentMethodEntity.getEmptyPaymentMethod();
    } else {
      _setInitialValuesToControllers();
    }
  }

  _setInitialValuesToControllers() {
    if (widget.paymentMethod?.monthAndYear == null ||
        widget.paymentMethod?.country == null) {
      return;
    }

    _controllers.monthAndYearController.text =
        widget.paymentMethod!.monthAndYear;
    _controllers.countryController.text = widget.paymentMethod!.country;
  }
}

class AddEditCardTextEditingControllers {
  final TextEditingController monthAndYearController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
}
