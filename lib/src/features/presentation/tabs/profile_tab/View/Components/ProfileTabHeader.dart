// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/features/presentation/Shared/StateProviders/user_state_provider.dart';
import 'package:flutter_application_test/src/utils/Helpers/DefaultImages/DefaultUserPhotoHelper.dart';
import '../../../../../../Colors/colors.dart';
import '../../../../../../utils/Helpers/ScreenSize/screen_size_helper.dart';

class ProfileTabHeaderView extends StatelessWidget {
  const ProfileTabHeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: bgGray,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage((context).getUserData()?.photo ??
                DefaultUserPhotoHelper.defaultUserPhoto),
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
                    SizedBox(
                      width: getScreenWidth(context: context, multiplier: 0.5),
                      child: Text((context).getUserData()?.username ?? "",
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 25,
                margin: const EdgeInsets.only(left: 20.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: rosa,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  child: Row(
                    children: [
                      const Image(
                          image: AssetImage('assets/crown.png'),
                          width: 16,
                          height: 16),
                      Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: const Text('Prime Member',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)))
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
}
