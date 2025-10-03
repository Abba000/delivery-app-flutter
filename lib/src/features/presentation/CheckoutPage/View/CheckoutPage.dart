// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import '../../../../colors/colors.dart';
import '../../Shared/Components/BackButtons/BackButtonView/View/BackButtonView.dart';
import '../../Shared/Components/Buttons/RoundedButton/View/RoundedButton.dart';
import '../../Shared/Components/Texts/TextView/View/TextView.dart';
//Colors

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 248, 250, 1.0),
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: const BackButtonView(color: Colors.black),
        title: const Text('Checkout',
            style: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
                fontWeight: FontWeight.w600)),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _cardOrder(context),
                  // Container(
                  //   margin: EdgeInsets.only(top: 50.0),
                  //   child: _touchID(),
                  // )
                ],
              ),
            ),
          ]))
        ],
      ),
    );
  }
}

Widget _cardOrder(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(20.0),
    margin: const EdgeInsets.symmetric(vertical: 10.0),
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(210, 211, 215, 1.0),
              spreadRadius: 1.0,
              blurRadius: 4.0)
        ]),
    child: Column(
      children: [
        const Row(
          children: [
            Text('DELIVERY ADDRESS',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600)),
            Spacer()
          ],
        ),
        _homeAddress(context),
        _resumeCheckout(context),
        _resumeOrder(context),
        const SizedBox(
          height: 20.0,
        ),
        const Row(
          children: [
            Text('PAYMENT METHOD',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600)),
            Spacer()
          ],
        ),
        _visa(context),
        _paypal(context),
        _masterCard(context),
        _moreContent(context),
        createElevatedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            func: () => _orderSuccess(context),
            labelButton: 'Pagar',
            color: naranja)
      ],
    ),
  );
}

Widget _homeAddress(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10.0),
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: const Color.fromRGBO(248, 248, 248, 1.0),
        border: Border.all(color: naranja)),
    child: const Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('HOME ADDRESS',
                style: TextStyle(
                    color: naranja,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600)),
            Text('928 Lehner Junction Apt. 047',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400))
          ],
        ),
        Spacer(),
        Icon(
          Icons.check_circle,
          color: naranja,
        )
      ],
    ),
  );
}

Widget _resumeCheckout(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10.0),
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: const Color.fromRGBO(248, 248, 248, 1.0),
        border: Border.all(color: naranja)),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Subtotal',
                style: TextStyle(
                    color: naranja,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600)),
            Text('93.20 €',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400)),
          ],
        ),
        Column(
          children: [
            Text('Tax & Fee',
                style: TextStyle(
                    color: naranja,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600)),
            Text('3.00 €',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400))
          ],
        ),
        Column(
          children: [
            Text('Delivery',
                style: TextStyle(
                    color: naranja,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600)),
            Text('Free',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400))
          ],
        ),
        Column(
          children: [
            Text('Total',
                style: TextStyle(
                    color: naranja,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600)),
            Text('95.40 €',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400))
          ],
        )
      ],
    ),
  );
}

Widget _resumeOrder(BuildContext context) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: const Color.fromRGBO(248, 248, 248, 1.0),
          border: Border.all(color: naranja)),
      child: _cardResumeOrder(context));
}

Widget _cardResumeOrder(BuildContext context) {
  return Column(
    children: [
      Row(
        children: [_cardOrderTopContent()],
      ),
      Column(
        children: [
          _items(context),
          _items(context),
          _items(context),
          _items(context)
        ],
      ),
    ],
  );
}

Widget _cardOrderTopContent() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20.0),
          child: const TextView(
              texto: "Little Creatures - Club Street",
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.location_on, color: gris, size: 16.0),
            const TextView(
                texto: "87 Botsford Circle Apt",
                color: gris,
                fontWeight: FontWeight.w500,
                fontSize: 14.0),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                width: 110.0,
                height: 20.0,
                child: createElevatedButton(
                    shape: const StadiumBorder(),
                    color: naranja,
                    labelColor: white,
                    labelButton: 'Free Delivery',
                    labelFontSize: 11.0))
          ],
        )
      ],
    ),
  );
}

Widget _items(context) {
  return Container(
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: const ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
              texto: 'Special Gajananad Bhel',
              color: naranja,
              fontWeight: FontWeight.w300,
              fontSize: 15.0),
          TextView(
              texto: 'Mixed vegetables, Chicken Egg',
              color: gris,
              fontWeight: FontWeight.w300,
              fontSize: 12.0)
        ],
      ),
      trailing: TextView(
          texto: '17.20 €',
          color: Colors.black,
          fontSize: 15.0,
          fontWeight: FontWeight.w400),
    ),
  );
}

Widget _moreContent(context) {
  return Transform.translate(
    offset: const Offset(-10, 0),
    child: const ListTile(
      title: TextView(
          texto: 'Add another payment method',
          color: rosa,
          fontWeight: FontWeight.w500,
          fontSize: 17.0),
    ),
  );
}

Widget _visa(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10.0),
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: const Color.fromRGBO(248, 248, 248, 1.0),
        border: Border.all(color: const Color.fromRGBO(248, 248, 248, 1.0))),
    child: Row(
      children: [
        const Image(
          image: AssetImage('assets/visa.png'),
          width: 30.0,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20.0),
          child: const Text('**** **** **** 5987',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400)),
        )
      ],
    ),
  );
}

Widget _paypal(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10.0),
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: const Color.fromRGBO(248, 248, 248, 1.0),
        border: Border.all(color: const Color.fromRGBO(248, 248, 248, 1.0))),
    child: Row(
      children: [
        const Image(
          image: AssetImage('assets/paypal.png'),
          width: 30.0,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20.0),
          child: const Text('wilson.casper@bernice.info',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400)),
        ),
        const Spacer(),
        const Icon(Icons.check_circle, color: naranja)
      ],
    ),
  );
}

Widget _masterCard(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10.0),
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: const Color.fromRGBO(248, 248, 248, 1.0),
        border: Border.all(color: const Color.fromRGBO(248, 248, 248, 1.0))),
    child: Row(
      children: [
        const Image(
          image: AssetImage('assets/mastercard.png'),
          width: 30.0,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20.0),
          child: const Text('**** **** **** 3567',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400)),
        )
      ],
    ),
  );
}

// Widget _touchID() {
//   return Column(
//     children: [
//       Image(
//         image: AssetImage('assets/touch.png'),
//         width: 50.0,
//         height: 50.0,
//       ),
//       Container(
//         margin: EdgeInsets.only(top: 10.0),
//         child: Text('Pay with Touch ID',
//             style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w300)),
//       )
//     ],
//   );
// }

Future _orderSuccess(BuildContext context) async {
  await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: SizedBox(
            height: 400,
            child: Column(
              children: [
                const Image(
                  image: AssetImage('assets/check_order.png'),
                  width: 130,
                  height: 130,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  child: const Text('Your order is successfully.',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                ),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  child: const Text(
                      "You can track the delivery in the Orders section.",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0)),
                ),
                _doneButton(context)
              ],
            ),
          ),
        );
      });
}

Widget _doneButton(BuildContext context) {
  return Column(
    children: [
      Container(
          width: 370.0,
          height: 45.0,
          margin: const EdgeInsets.only(top: 40.0, bottom: 20.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: naranja,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
            onPressed: () {},
            child: const Text(
              'Continue Shopping',
              style: TextStyle(color: Colors.white, fontSize: 17.0),
            ),
          )),
      const Text("Go to orders",
          style: TextStyle(
              color: gris, fontWeight: FontWeight.w400, fontSize: 15.0))
    ],
  );
}
