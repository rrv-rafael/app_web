import 'package:app_web/constants/style.dart';
import 'package:app_web/helpers/responsive.dart';
import 'package:app_web/widgets/custom_text.dart';
import 'package:flutter/material.dart';

AppBar topAppBar(BuildContext context, GlobalKey<ScaffoldState> key) => AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Image.asset(
                    "assets/icons/logo.png",
                    width: 28.0,
                  ),
                ),
              ],
            )
          : IconButton(
              icon: const Icon(
                Icons.menu,
                // color: Colors.blue,
              ),
              onPressed: () {
                key.currentState?.openDrawer();
              },
            ),
      elevation: 0,
      // backgroundColor: Colors.white,
      title: Row(
        children: [
          Visibility(
            child: CustomText(
              text: "Dash",
              color: lightGrey,
              size: 20,
              weight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: dark.withOpacity(.7),
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: dark.withOpacity(.7),
                ),
              ),
              Positioned(
                top: 7.0,
                right: 7.0,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: active,
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      color: light,
                      width: 2,
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            width: 1.0,
            height: 22.0,
            color: lightGrey,
          ),
          const SizedBox(
            width: 24.0,
          ),
          CustomText(
            text: "Rafael Rodrigues Vitor",
            size: 18,
            color: lightGrey,
            weight: FontWeight.bold,
          ),
          const SizedBox(
            width: 16.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(2.0),
              margin: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                backgroundColor: light,
                child: Icon(
                  Icons.person,
                  color: dark,
                ),
              ),
            ),
          ),
        ],
      ),
      iconTheme: IconThemeData(color: dark),
      backgroundColor: light,
    );
