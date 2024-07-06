// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/MainCordinator/MainCordinator.dart';

import '../../../../../../Colors/colors.dart';
import '../../../../../../base/Views/BaseView.dart';
import '../../../../Shared/Components/Alerts/AlertView/Model/AlertViewModel.dart';
import '../../../../Shared/Components/Alerts/AlertView/View/AlertView.dart';
import '../../ViewModel/ProfileTabsViewModel.dart';

class ProfileTabContentView extends StatelessWidget with BaseView {
  final ProfileTabViewModel viewModel;

  ProfileTabContentView({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            leading: const Image(
              image: AssetImage('assets/settingicon.png'),
              width: 29,
              height: 29,
            ),
            title: const Text('My Information',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w400)),
            trailing: const Icon(Icons.chevron_right, color: gris),
            onTap: () => Navigator.pushNamed(context, 'profile-detail'),
          ),
          const Divider(),
          const SizedBox(height: 4),
          const ListTile(
            leading: Image(
              image: AssetImage('assets/rewardicon.png'),
              width: 29,
              height: 29,
            ),
            title: Text('Delivery Prime',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w400)),
            trailing: Icon(Icons.chevron_right, color: gris),
          ),
          const ListTile(
            leading: Image(
              image: AssetImage('assets/promoicon.png'),
              width: 29,
              height: 29,
            ),
            title: Text('Promo Code',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w400)),
            trailing: Icon(Icons.chevron_right, color: gris),
          ),
          const ListTile(
            leading: Image(
              image: AssetImage('assets/inviteicon.png'),
              width: 29,
              height: 29,
            ),
            title: Text('Invite Friends',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w400)),
            trailing: Icon(Icons.chevron_right, color: gris),
          ),
          const Divider(),
          const SizedBox(height: 4),
          const ListTile(
            leading: Image(
              image: AssetImage('assets/noti.png'),
              width: 29,
              height: 29,
            ),
            title: Text('Notifications',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w400)),
            trailing: Icon(Icons.chevron_right, color: gris),
          ),
          const ListTile(
            leading: Image(
              image: AssetImage('assets/helpicon.png'),
              width: 29,
              height: 29,
            ),
            title: Text('F.A.Q',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w400)),
            trailing: Icon(Icons.chevron_right, color: gris),
          ),
          const ListTile(
            leading: Image(
              image: AssetImage('assets/abouticon.png'),
              width: 29,
              height: 29,
            ),
            title: Text('About us',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w400)),
            trailing: Icon(Icons.chevron_right, color: gris),
          ),
          const Divider(),
          const SizedBox(height: 4),
          const ListTile(
            leading: Image(
              image: AssetImage('assets/errorIcon.png'),
              width: 29,
              height: 29,
            ),
            title: Text('Eliminar mi cuenta',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w400)),
            trailing: Icon(Icons.chevron_right, color: gris),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/logout.png'),
              width: 29,
              height: 29,
            ),
            title: const Text('Cerrar sesión',
                style: TextStyle(fontWeight: FontWeight.w400)),
            trailing: const Icon(Icons.chevron_right, color: gris),
            onTap: () => signOut(context),
          )
        ],
      ),
    );
  }

  void signOut(BuildContext context) {
    AlertView.showAlertDialog(
        model: AlertViewModel(
            context,
            const AssetImage('assets/logout.png'),
            'Cierre de sesión en curso',
            "¿Desear salir de la sesión actual?",
            'Cerrar sesión',
            "Cancelar", () {
      viewModel
          .signOut()
          .then((value) => coordinator.logoutNavigation(context: context));
    }, () {
      Navigator.pop(context);
    }));
  }
}




/*
ListTile(
          leading: Image(
            image: AssetImage('assets/payicon.png'),
            width: 29,
            height: 29,
          ),
          title: Text('Payment methods',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400)
          ),
          trailing: Icon(Icons.chevron_right, color: greyColor),
        )

 */
