import 'package:app_web/constants/controllers.dart';
import 'package:app_web/constants/style.dart';
import 'package:app_web/helpers/responsive.dart';
import 'package:app_web/routing/routes.dart';
import 'package:app_web/widgets/custom_text.dart';
import 'package:app_web/widgets/side_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: _width / 48.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Image.asset("assets/icons/logo.png"),
                    ),
                    Flexible(
                      child: CustomText(
                        text: "Dash",
                        size: 20,
                        color: active,
                        weight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: _width / 48.0,
                    )
                  ],
                ),
              ],
            ),
          const SizedBox(
            height: 40.0,
          ),
          Divider(
            color: lightGrey.withOpacity(.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map(
                  (itemName) => SideMenuItem(
                    itemName: itemName == AuthenticationPageRoute ? "Log Out" : itemName,
                    onTap: () {
                      if (itemName == AuthenticationPageRoute) {
                        //Vá para a authentication page
                      }

                      if (!menuController.isActive(itemName)) {
                        menuController.changeActiveItemTo(itemName);
                        if (ResponsiveWidget.isSmallScreen(context)) {
                          Get.back();
                        }
                        //Vá para o item name da rota
                      }
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
