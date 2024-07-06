import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/LoadingStatusProvider.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Alerts/alert_dialog.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Buttons/rounded_button.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Headers/header_text.dart';
import 'package:flutter_application_test/src/features/presentation/Tabs/profile_tab/ViewModel/ProfileTabsViewModel.dart';
import 'package:flutter_application_test/src/features/presentation/Auth/welcome_page/View/welcome_pages.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final ProfileTabViewModel _viewModel;

  _ProfileTabState({ProfileTabViewModel? profileTabViewModel})
      : _viewModel = profileTabViewModel ?? DefaultProfileTabViewModel();

  @override
  Widget build(BuildContext context) {
    //Inicializamos el viewModel

    _viewModel.initState(
        loadingState: Provider.of<LoadingStateProvider>(context));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Column(
              children: [
                GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'profile-detail'),
                    child: _header()),
                _contentProfile(context)
              ],
            ),
          ]))
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      height: 250,
      color: bgGray,
      padding: const EdgeInsets.all(50),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center, // Para centrar el avatar horizontalmente
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.jpg'),
            radius: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    headerText(
                        texto: 'Cameron Cook',
                        color: negro,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    IconButton(
                      icon: const Icon(Icons.chevron_right, color: gris),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Container(
                height: 25,
                margin: const EdgeInsets.only(left: 20.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0.5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: rosa,
                  ),
                  child: Row(
                    children: [
                      const Image(
                        image: AssetImage('assets/images/crown.png'),
                        width: 16,
                        height: 16,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: headerText(
                          texto: 'VIP Member',
                          color: white,
                          fontSize: 11,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _contentProfile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            leading: const Image(
              image: AssetImage('assets/images/noti.png'),
              width: 29,
              height: 29,
            ),
            title: headerText(
                texto: 'Notifications',
                fontWeight: FontWeight.w400,
                fontSize: 11),
            trailing: const Icon(Icons.chevron_right, color: gris),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/images/payicon.png'),
              width: 29,
              height: 29,
            ),
            title: headerText(
                texto: 'Payment methods',
                fontWeight: FontWeight.w400,
                fontSize: 11),
            trailing: const Icon(Icons.chevron_right, color: gris),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/images/rewardicon.png'),
              width: 29,
              height: 29,
            ),
            title: headerText(
                texto: 'History', fontWeight: FontWeight.w400, fontSize: 11),
            trailing: const Icon(Icons.chevron_right, color: gris),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/images/promoicon.png'),
              width: 29,
              height: 29,
            ),
            title: headerText(
                texto: 'Promo Code', fontWeight: FontWeight.w400, fontSize: 11),
            trailing: const Icon(Icons.chevron_right, color: gris),
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/images/settingicon.png'),
              width: 29,
              height: 29,
            ),
            title: headerText(
                texto: 'Settings', fontWeight: FontWeight.w400, fontSize: 11),
            trailing: const Icon(Icons.chevron_right, color: gris),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/images/inviteicon.png'),
              width: 29,
              height: 29,
            ),
            title: headerText(
                texto: 'Invite Friends',
                fontWeight: FontWeight.w400,
                fontSize: 11),
            trailing: const Icon(Icons.chevron_right, color: gris),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/images/helpicon.png'),
              width: 29,
              height: 29,
            ),
            title: headerText(
                texto: 'Help center',
                fontWeight: FontWeight.w400,
                fontSize: 11),
            trailing: const Icon(Icons.chevron_right, color: gris),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/images/abouticon.png'),
              width: 29,
              height: 29,
            ),
            title: headerText(
                texto: 'About us', fontWeight: FontWeight.w400, fontSize: 11),
            trailing: const Icon(Icons.chevron_right, color: gris),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/images/logout.png'),
              width: 29,
              height: 29,
            ),
            title: const Text('Cerrar sesion',
                style: TextStyle(fontWeight: FontWeight.w400)),
            trailing: const Icon(Icons.chevron_right, color: gris),
            onTap: () => _signOut(context),
          ),
        ],
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    showAlertDialog(
        context,
        const AssetImage('assets/logout.png'),
        'Cierre de sesión en curso',
        '¿Desea salir de la sesión actual?',
        'EnableLocation location',
        createElevatedButton(
            context: context,
            color: naranja,
            labelButton: 'EnableLocation location',
            func: () {
              _viewModel.signOut().then((_) {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => WelcomePage()));
              });
            }));
  }
}
