// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/base/Constants/ErrorMessage.dart';
import 'package:flutter_application_test/src/features/presentation/Profile/ProfileDetailPage/View/components/AvatarProfileView.dart';
import 'package:flutter_application_test/src/features/presentation/Profile/ProfileDetailPage/View/components/FieldProfileView.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/ErrorStateProvider.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/LoadingStatusProvider.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/user_state_provider.dart';
import 'package:flutter_application_test/src/utils/Helpers/ScreenSize/screen_size_helper.dart';
import 'package:flutter_application_test/src/utils/Styles/BoxShadowDecoration.dart';

import '../../../../../base/Views/BaseView.dart';
import '../../../../../utils/Helpers/DefaultImages/DefaultUserPhotoHelper.dart';
import '../../../../domain/Entities/User/UserEntity.dart';
import '../../../Shared/Components/AppBar/AppBarDoneView.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({Key? key}) : super(key: key);

  @override
  _ProfileDetailPageState createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage>
    with FieldsProfileDetailViewDelegate, BaseView {
  String _actionText = "";
  late DefaultUserStateProvider _defaultUserStateProvider;
  UserEntity? newUser;

  @override
  Widget build(BuildContext context) {
    _defaultUserStateProvider = (context).getDefaultUserStateProvider();

    return Scaffold(
      appBar: createAppBarDone(
          actionText: _actionText, onTap: updateUserData, title: 'Profile'),
      body: (context).isLoading()
          ? loadingView
          : CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  Container(
                      margin: EdgeInsets.only(
                          top: getScreenHeight(
                              context: context, multiplier: 0.05),
                          left: 16,
                          right: 16),
                      padding: const EdgeInsets.only(bottom: 32),
                      decoration: getBoxDecorationWithShadows(),
                      width: getScreenWidth(context: context),
                      child: Column(
                        children: [
                          Transform.translate(
                              offset: Offset(
                                  0,
                                  -getScreenHeight(
                                      context: context, multiplier: 0.03)),
                              child: AvatarProfileDetailView(
                                  backgroundImage: _defaultUserStateProvider
                                          .userData?.photo ??
                                      DefaultUserPhotoHelper.defaultUserPhoto)),
                          FieldsProfileDetailView(
                              userData: _defaultUserStateProvider.userData,
                              delegate: this)
                        ],
                      )),
                  SizedBox(
                      height:
                          getScreenHeight(context: context, multiplier: 0.1))
                ]))
              ],
            ),
    );
  }

  updateUserData() {
    if (newUser == null) {
      return;
    }

    setState(() {
      (context).setLoadingState(isLoading: true);
    });

    _defaultUserStateProvider.updateUserData(user: newUser!).then((result) {
      setState(() {
        (context).setLoadingState(isLoading: false);
        _actionText = "";
      });
    }, onError: (e) {
      setState(() {
        (context).setLoadingState(isLoading: false);
        (context).showErrorAlert(
            context: context,
            message: AppFailureMessages.unExpectedErrorMessage);
      });
    });
  }

  @override
  userDataChanged({required UserEntity? newUser}) {
    setState(() {
      if (newUser?.username?.isNotEmpty ?? false) {
        this.newUser = newUser;
        _actionText = "Save";
      } else {
        _actionText = "";
      }
    });
  }
}
