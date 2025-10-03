// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/LoadingStatusProvider.dart';
import 'package:flutter_application_test/src/features/presentation/Tabs/profile_tab/View/Components/ProfileTabContentView.dart';
import 'package:flutter_application_test/src/features/presentation/Tabs/profile_tab/View/Components/ProfileTabHeader.dart';
import 'package:flutter_application_test/src/features/presentation/Tabs/profile_tab/ViewModel/ProfileTabsViewModel.dart';
import 'package:provider/provider.dart';

import '../../../../../base/Views/BaseView.dart';
import '../../../Shared/Components/Alerts/AlertView/Model/AlertViewModel.dart';
import '../../../Shared/Components/Alerts/AlertView/View/AlertView.dart';
import '../../../Shared/MainCordinator/MainCordinator.dart';
import '../../../Shared/StateProviders/user_state_provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> with BaseView {
  // ViewModel
  final ProfileTabViewModel _profileTabViewModel = DefaultProfileTabViewModel();

  @override
  Widget build(BuildContext context) {
    // Init ViewModel
    _profileTabViewModel.initState(
        loadingState: Provider.of<LoadingStateProvider>(context));
    Provider.of<DefaultUserStateProvider>(context)
        .fetchUserData(localId: MainCoordinator.sharedInstance?.userUid ?? "");

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          Column(
            children: [
              const ProfileTabHeaderView(),
              ProfileTabContentView(viewModel: _profileTabViewModel)
            ],
          )
        ]))
      ],
    ));
  }
}

extension UserActions on _ProfileTabState {
  void signOut(BuildContext context) {
    AlertView.showAlertDialog(
        model: AlertViewModel(
            context,
            const AssetImage('assets/logout.png'),
            'Cierre de sesión en curso',
            "¿Desear salir de la sesión actual?",
            'Cerrar sesión',
            "Cancelar", () {
      _profileTabViewModel
          .signOut()
          .then((value) => coordinator.logoutNavigation(context: context));
    }, () {
      Navigator.pop(context);
    }));
  }
}
