import 'package:flutter/material.dart';
//colors
import 'package:flutter_application_test/src/colors/colors.dart';
import 'package:flutter_application_test/src/features/presentation/commons_widgets/Cards/favourite_card.dart';
import 'package:flutter_application_test/src/features/presentation/commons_widgets/Headers/header_text.dart';

class FavouriteTab extends StatefulWidget {
  const FavouriteTab({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FavouriteTabState createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGray,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: const Text(''),
            backgroundColor: white,
            title: headerText(
              texto: 'My favourites',
              color: primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 17.0,
            ),
            centerTitle: true, // Esta línea centra el título
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  createFavouritesCard(
                      context: context,
                      image: const NetworkImage(
                          'https://images.unsplash.com/photo-1529417305485-480f579e7578?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                      title: "Andy & Cindy's Diners",
                      subtitle: "87 Botsford Circle Apt",
                      review: "4.8",
                      ratings: "(233 ratings)",
                      buttonText: 'Delivery',
                      hasActionButton: true,
                      isFavourite: true),
                  createFavouritesCard(
                      context: context,
                      image: const NetworkImage(
                          'https://images.unsplash.com/photo-1529417305485-480f579e7578?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                      title: "Andy & Cindy's Diners",
                      subtitle: "87 Botsford Circle Apt",
                      review: "4.8",
                      ratings: "(233 ratings)",
                      buttonText: 'Delivery',
                      hasActionButton: true,
                      isFavourite: false)
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}
