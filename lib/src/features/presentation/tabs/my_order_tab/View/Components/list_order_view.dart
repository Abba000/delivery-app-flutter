import 'package:flutter/material.dart';
// Colors
import 'package:flutter_application_test/src/colors/colors.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Buttons/rounded_button.dart';
// Widgets
import 'package:flutter_application_test/src/features/presentation/Shared/commons_widgets/Headers/header_text_button.dart';

class ListOrdersView extends StatelessWidget {
  const ListOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGray,
      appBar: AppBar(
        elevation: 0.5,
        leading: const Text(''),
        backgroundColor: white,
        title: createText(
          texto: 'Orders',
          color: primaryColor,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true, // Esta línea centra el título
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            const ListOrderCard(),
            const ListOrderCard(),
            const ListOrderCard()
          ]))
        ],
      ),
    );
  }
}

class ListOrderCard extends StatelessWidget {
  const ListOrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(248, 248, 248, 1.0),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(210, 211, 215, 1.0),
                spreadRadius: 1.0,
                blurRadius: 4.0)
          ]),
      child: Column(
        children: [
          const ListCardOrderHeader(),
          const ListCardOrderItem(),
          const SizedBox(height: 10),
          createText(
              texto: 'See Order',
              fontSize: 17,
              color: rosa,
              fontWeight: FontWeight.w400),
          createElevatedButton(
              labelColor: white,
              labelButton: 'Order Again',
              color: naranja,
              func: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class ListCardOrderHeader extends StatelessWidget {
  const ListCardOrderHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            top: 7.0, bottom: 7.0, right: 20.0),
                        child: createText(
                            texto: "Little Creatures - Club Street",
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_on,
                              color: gris, size: 16.0),
                          createText(
                              texto: "87 Botsford Circle Apt",
                              color: gris,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0)
                        ],
                      ),
                    ],
                  ),
                  createElevatedButton(
                      width: 168,
                      height: 28,
                      labelColor: Colors.white,
                      labelButton: "Entregado - 21/07/21",
                      labelFontSize: 12,
                      color: Colors.green,
                      shape: const StadiumBorder(),
                      func: () {})
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const Image(
                  width: 70,
                  height: 74,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1529417305485-480f579e7578?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ListCardOrderItem extends StatelessWidget {
  const ListCardOrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Theme.of(context).dividerColor))),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            createText(
                texto: '2 products',
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 15.0)
          ],
        ),
        trailing: createText(
            texto: '17.20 €',
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16.0),
      ),
    );
  }
}
