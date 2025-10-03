// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/LoadingStatusProvider.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/user_state_provider.dart';
import '../../../../../base/Views/BaseView.dart';
import '../../../../../utils/Helpers/Validators/FormValidator.dart';
import '../../../Auth/forgot_password_page/ViewModel/ForgotPasswordViewModel.dart';
import '../../../Shared/Components/AppBar/AppBarDoneView.dart';
import 'Components/EmailTextFieldCardView.dart';

class EditPasswordPage extends StatefulWidget {
  const EditPasswordPage({Key? key}) : super(key: key);

  @override
  State<EditPasswordPage> createState() => _EditPasswordPageState();
}

class _EditPasswordPageState extends State<EditPasswordPage>
    with EmailTextFieldCardViewDelegate, BaseView {
  String _actionText = "Done";
  String? _email;

  // Dependencies
  final UpdatePasswordViewModel _viewModel;

  _EditPasswordPageState({UpdatePasswordViewModel? updatePasswordViewModel})
      : _viewModel =
            updatePasswordViewModel ?? DefaultUpdatePasswordViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBarDone(
          actionText: _actionText,
          onTap: _sendEditPasswordEmail,
          title: 'Edit Password'),
      body: (context).isLoading()
          ? loadingView
          : CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  const SizedBox(height: 16),
                  EmailTextFieldCardView(
                      delegate: this,
                      title:
                          "Please enter your email address. You will receive a link to create a new password via email.",
                      initialValue: (context).getUserData()?.email)
                ]))
              ],
            ),
    );
  }

  _sendEditPasswordEmail() {
    if (_email == null) {
      return;
    }
    setState(() {
      (context).setLoadingState(isLoading: true);
    });
    _viewModel.updatePassword(email: _email ?? "").then((_) {
      setState(() {
        (context).setLoadingState(isLoading: false);
      });
      Navigator.pop(context);
    });
  }

  @override
  emailChanged({required String email}) {
    setState(() {
      if (email.isEmpty ||
          EmailFormValidator.validateEmail(email: email) != null) {
        _email = null;
        _actionText = "";
      } else {
        _email = email;
        _actionText = "Done";
      }
    });
  }
}
