import 'package:flutter/material.dart';
// Colors
import 'package:flutter_application_test/src/colors/colors.dart';
// Commons
import 'package:flutter_application_test/src/features/presentation/commons_widgets/BackButtons/back_button.dart';
import 'package:flutter_application_test/src/features/presentation/commons_widgets/Headers/header_text_button.dart';
import 'package:flutter_application_test/src/features/presentation/profile_detail_page/View/components/avatar_view.dart';
import 'package:flutter_application_test/src/utils/Helpers/ScreenSize/screen_size_helper.dart';
import 'package:flutter_application_test/src/utils/Styles/BoxShadowDecoration.dart';
// Utils
import 'components/fields_profile_view.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileDetailPageState createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  var backgroundImage =
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This avoid bottom overflowed keyboard error withot scrollview
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: createText(texto: 'Edit Profile', fontSize: 17),
        centerTitle: true,
        backgroundColor: white,
        elevation: 0.4,
        leading: Builder(
          builder: (BuildContext context) {
            return backButton(context, negro);
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                padding: const EdgeInsets.only(top: 5, right: 15.0),
                child: createText(
                    texto: 'Done',
                    color: naranja,
                    fontWeight: FontWeight.w500,
                    fontSize: 17.0)),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
                margin: EdgeInsets.only(
                    top: getScreenHeight(context: context, multiplier: 0.1),
                    left: 15,
                    right: 15),
                decoration: getBoxDecorationWithShadows(),
                width: getScreenWidth(context: context),
                height: getScreenHeight(context: context, multiplier: 0.75),
                child: Column(
                  children: [
                    Transform.translate(
                        offset: const Offset(0, -60),
                        child: AvatarView(backgroundImage: backgroundImage)),
                    const FieldsProfileView()
                  ],
                ))
          ]))
        ],
      ),
    );
  }
}
