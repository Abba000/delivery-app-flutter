import 'package:flutter/material.dart';
//Colors
import 'package:flutter_application_test/src/colors/colors.dart';
import 'package:flutter_application_test/src/features/presentation/commons_widgets/BackButtons/back_button.dart';
//Commons Widgets
import 'package:flutter_application_test/src/features/presentation/commons_widgets/Buttons/rounded_button.dart';
import 'package:flutter_application_test/src/features/presentation/commons_widgets/Headers/header_double.dart';
import 'package:flutter_application_test/src/features/presentation/commons_widgets/Headers/header_text.dart';
import 'package:flutter_application_test/src/features/presentation/commons_widgets/Headers/header_text_button.dart';

class PlaceDetailPage extends StatelessWidget {
  const PlaceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: naranja,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          label: createText(
              texto: 'Añadir a la Cesta  95.40 €',
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 17)),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: naranja,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
                background: Stack(
              children: [
                const Image(
                    width: double.infinity,
                    height: 360,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1493770348161-369560ae357d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')),
                Container(
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 1.5)),
                    width: double.infinity,
                    height: 360),
                Wrap(
                  children: [
                    _promoButton(),
                    _infoPlace(),
                    _infoPlaceStats(),
                    _offerBanner()
                  ],
                )
              ],
            )),
            leading: Builder(builder: (BuildContext context) {
              return backButton(context, Colors.white);
            }),
            actions: [
              Container(
                margin: const EdgeInsets.all(10),
                child: const Image(
                    width: 23,
                    height: 23,
                    image: AssetImage('assets/share.png')),
              ),
              IconButton(
                  icon: const Icon(
                    Icons.bookmark_border,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {})
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            _headers(texto: 'Populars'),
            _sliderCards(),
            _headers(texto: 'Full Menu'),
            _menuList(context),
            _headers(texto: 'Reviews'),
            _reviews(),
            _headers(texto: 'Your Rating'),
            _yourRating(),
            const SizedBox(height: 150.0),
          ]))
        ],
      ),
    );
  }
}

Widget _promoButton() {
  return Container(
    margin: const EdgeInsets.only(top: 90.0, left: 30.0, right: 15.0),
    width: double.infinity,
    height: 50,
    child: Row(children: [
      createElevatedButton(
          color: naranja,
          labelButton: 'Free Delivery',
          // ignore: avoid_print
          func: () => print("hello"))
    ]),
  );
}

Widget _infoPlace() {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        margin: const EdgeInsets.symmetric(vertical: 7.0),
        child: createText(
            texto: "Boon Lay Ho Huat Fried Prawn Noodle",
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          children: [
            const Icon(Icons.location_on, color: gris),
            createText(
                texto: "03 Jameson Manors Apt. 177",
                color: gris,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
          ],
        ),
      )
    ],
  );
}

Widget _infoPlaceStats() {
  return Container(
    margin: const EdgeInsets.only(top: 26.0),
    padding: const EdgeInsets.symmetric(horizontal: 40.0),
    height: 70.0,
    decoration: const BoxDecoration(
        border: Border(
            top: BorderSide(color: Colors.white),
            bottom: BorderSide(color: Colors.white))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Icon(
                Icons.star,
                color: Colors.white,
                size: 19.0,
              ),
              createText(
                  texto: '4.5',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0)
            ]),
            createText(
                texto: "351 Ratings",
                color: gris,
                fontWeight: FontWeight.w500,
                fontSize: 15.0)
          ],
        ),
        Container(
          height: 40,
          decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: Colors.white))),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Icon(
                Icons.bookmark,
                color: Colors.white,
                size: 19.0,
              ),
              createText(
                  texto: '137k',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0)
            ]),
            createText(
                texto: "Favourites",
                color: gris,
                fontWeight: FontWeight.w500,
                fontSize: 15.0)
          ],
        ),
        Container(
          height: 40,
          decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: Colors.white))),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Icon(
                Icons.photo,
                color: Colors.white,
                size: 19.0,
              ),
              createText(
                  texto: '345',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0)
            ]),
            createText(
                texto: "Photos",
                color: gris,
                fontWeight: FontWeight.w500,
                fontSize: 15.0)
          ],
        ),
      ],
    ),
  );
}

Widget _offerBanner() {
  return Container(
    color: const Color.fromRGBO(255, 237, 214, 1.0),
    padding: const EdgeInsets.all(15),
    height: 90.0,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerText(
                texto: 'New! Try Pickup',
                color: naranja,
                fontWeight: FontWeight.bold,
                fontSize: 15.0),
            headerText(
                texto:
                    'Pickup on your time. Your order is \nready when you are.',
                color: primaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 13.0),
          ],
        ),
        const SizedBox(width: 45),
        Expanded(
            child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin:
                const EdgeInsets.only(bottom: 12), // Margen inferior del botón
            child: createElevatedButton(
                color: naranja,
                height: 40.0,
                width: 125.0,
                labelButton: 'Order Now',
                // ignore: avoid_print
                func: () => print("hello")),
          ),
        )),
      ],
    ),
  );
}

Widget _headers({texto = String}) {
  return Container(
      margin: const EdgeInsets.only(top: 20.0, bottom: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: headerDoubleText(textHeader: texto, textAction: ''));
}

Widget _sliderCards() {
  return Container(
      height: 210.0,
      padding: const EdgeInsets.only(left: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return _cards();
          }));
}

Widget _cards() {
  return Container(
    margin: const EdgeInsets.all(8.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: const Image(
            width: 200.0,
            height: 100.0,
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://images.unsplash.com/photo-1493770348161-369560ae357d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')),
      ),
      Container(
        margin: const EdgeInsets.only(top: 10),
        child: createText(
            texto: "Peanut Chaat with Dahi",
            fontWeight: FontWeight.bold,
            fontSize: 15.0),
      ),
      Container(
        alignment: Alignment.centerLeft,
        child: createText(
            texto: "9.50 €",
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
            color: gris),
      ),
      Row(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: createText(
                texto: "Selecciona",
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
                color: naranja),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 90),
            child: const Image(
                width: 20.0,
                height: 20.0,
                fit: BoxFit.cover,
                image: AssetImage('assets/plus_order.png')),
          )
        ],
      )
    ]),
  );
}

Widget _menuList(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(left: 10.0),
    child: Column(
      children: [
        _menuItem(context, 'Salads', '2'),
        _menuItem(context, 'Chicken', '5'),
        _menuItem(context, 'Soups', '6'),
        _menuItem(context, 'Vegetables', '7')
      ],
    ),
  );
}

Widget _menuItem(BuildContext context, String texto, String itemCount) {
  return Container(
    decoration:
        const BoxDecoration(border: Border(bottom: BorderSide(color: gris))),
    child: Column(
      children: [
        ListTile(
          title: createText(
              texto: texto, fontWeight: FontWeight.w300, fontSize: 17.0),
          trailing: createText(
              texto: itemCount, fontWeight: FontWeight.w300, fontSize: 17.0),
        ),
        _sliderCards()
      ],
    ),
  );
}

Widget _reviews() {
  return Container(
    height: 155,
    padding: const EdgeInsets.only(left: 10),
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _cardReviews();
        }),
  );
}

Widget _cardReviews() {
  var lorem =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua";

  return Container(
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.only(left: 10, right: 10),
    width: 350,
    child: Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: const Image(
                  width: 49.0,
                  height: 43.0,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1614746713986-0afbec40881f?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNDN8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  createText(
                      texto: 'Mike Smithson',
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                  createText(
                      texto: '45 Reviews',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: gris)
                ],
              ),
            ),
            const Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 60,
                height: 30,
                color: naranja,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    createText(
                        texto: '4',
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                    const Icon(Icons.star, color: Colors.white, size: 14)
                  ],
                ),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: createText(
              texto: lorem,
              color: gris,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.left),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: createText(
              texto: 'See full review',
              color: naranja,
              fontSize: 15,
              fontWeight: FontWeight.w500),
        )
      ],
    ),
  );
}

Widget _yourRating() {
  var lorem =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua";

  return Container(
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 60,
                height: 30,
                color: naranjaOpaco,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    createText(
                        texto: '1',
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                    const Icon(Icons.star, color: Colors.white, size: 14)
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 60,
                height: 30,
                color: naranjaOpaco,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    createText(
                        texto: '2',
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                    const Icon(Icons.star, color: Colors.white, size: 14)
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 60,
                height: 30,
                color: naranjaOpaco,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    createText(
                        texto: '3',
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                    const Icon(Icons.star, color: Colors.white, size: 14)
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 60,
                height: 30,
                color: naranja,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    createText(
                        texto: '4',
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                    const Icon(Icons.star, color: Colors.white, size: 14)
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 60,
                height: 30,
                color: naranjaOpaco,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    createText(
                        texto: '5',
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                    const Icon(Icons.star, color: Colors.white, size: 14)
                  ],
                ),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 20),
          child: createText(
              texto: lorem,
              color: gris,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.left),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 20),
          child: createText(
              texto: "+ Edit your review", // Esto cuando ya tenga review
              fontWeight: FontWeight.w500,
              fontSize: 15.0,
              color: naranja),
        )
      ],
    ),
  );
}
