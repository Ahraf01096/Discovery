import 'package:discovery/utils/constants.dart';
import 'package:discovery/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../search/presintation/views/search_place.dart';
import 'custom_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            icon: Icon(
              Icons.menu_outlined,
              color: Constants.kSecondColor,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
          //CurrentLocation(),
          Text('Discovery',style: Styles.textStyle30.copyWith(fontWeight: FontWeight.w700),),
          CustomIconButton(
            icon: Icon(
              Icons.search,
              color: Constants.kSecondColor,
            ),onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchPlace()));
          },),
          // CustomIconButton(
          //     icon: Icon(
          //   Icons.notifications_none_outlined,
          //   color: Constants.kSecondColor,
          // ),onPressed: (){
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => Activities()));
          // },),

        ],
      ),
    );
  }
}
