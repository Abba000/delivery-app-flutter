import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';
import 'package:flutter_application_test/src/features/presentation/Tabs/my_order_tab/View/Components/empty_order_view.dart';
import 'package:flutter_application_test/src/features/presentation/Tabs/my_order_tab/View/Components/list_order_view.dart';

class MyOrderTab extends StatefulWidget {
  const MyOrderTab({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyOrderTabState createState() => _MyOrderTabState();
}

class _MyOrderTabState extends State<MyOrderTab> {
  final emptyOrderState = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgGray,
        body: emptyOrderState ? EmptyOrderView() : const ListOrdersView());
  }
}
