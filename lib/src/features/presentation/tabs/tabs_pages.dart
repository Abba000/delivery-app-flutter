import 'package:flutter/material.dart';
//commons widgets
import 'package:flutter_application_test/src/features/presentation/commons_widgets/Alerts/alert_dialog.dart';
import 'package:flutter_application_test/src/features/presentation/commons_widgets/Buttons/rounded_button.dart';
//colors
import 'package:flutter_application_test/src/colors/colors.dart';
//tabs
import 'package:flutter_application_test/src/features/presentation/tabs/explore_tab/View/explore_tab.dart';
import 'package:flutter_application_test/src/features/presentation/tabs/favourite_tab/View/favourite_tab.dart';
import 'package:flutter_application_test/src/features/presentation/tabs/my_order_tab/View/my_order_tab.dart';
import 'package:flutter_application_test/src/features/presentation/tabs/profile_tab/View/profile_tab.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _pedirLocation(context);
    });
  }

  final List<Widget> _widgetOptions = [
    const ExploreTab(),
    const MyOrderTab(),
    const FavouriteTab(),
    const ProfileTab()
  ];

  int _selectedItemIndex = 0;

  void _cambiarWidget(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedItemIndex),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
        iconSize: 30.0,
        selectedItemColor: naranja,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedItemIndex,
        onTap: _cambiarWidget,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: 'My Order'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Favourite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin), label: 'Profile')
        ]);
  }

  Future _pedirLocation(BuildContext context) async {
    showAlertDialog(
        context,
        const AssetImage('assets/location.png'),
        'Enable your Location',
        "Please allow to use your location to show nearby restaurant on the map.",
        createElevatedButton(
            color: naranja,
            labelButton: 'Enable Location',
            shape: const StadiumBorder(),
            func: () {}));
  }
}
