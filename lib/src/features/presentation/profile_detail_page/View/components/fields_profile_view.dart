import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/utils/Helpers/ScreenSize/screen_size_helper.dart';

class FieldsProfileView extends StatelessWidget {
  const FieldsProfileView({super.key});

  // const FieldsProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _createUserNameItem(context),
        _createEmailItem(context),
        _createPhoneItem(context),
        _createDateOfBirthItem(context),
        _createDeliverAdreessItem(context)
      ],
    );
  }
}

Widget _createUserNameItem(context) {
  return Container(
    width: getScreenWidth(context: context, multiplier: 0.85),
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: const ListTile(
      title: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            hintText: 'Username',
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    ),
  );
}

Widget _createEmailItem(context) {
  return Container(
    width: getScreenWidth(context: context, multiplier: 0.85),
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: const ListTile(
      title: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Email',
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    ),
  );
}

Widget _createPhoneItem(context) {
  return Container(
    width: getScreenWidth(context: context, multiplier: 0.85),
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: const ListTile(
      title: TextField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            hintText: 'Phone',
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    ),
  );
}

Widget _createDateOfBirthItem(context) {
  return Container(
    width: getScreenWidth(context: context, multiplier: 0.85),
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: const ListTile(
      title: TextField(
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
            hintText: 'Date of Birth',
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    ),
  );
}

Widget _createDeliverAdreessItem(context) {
  return Container(
    width: getScreenWidth(context: context, multiplier: 0.85),
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: const ListTile(
      title: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            hintText: 'Delivery Address',
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    ),
  );
}
