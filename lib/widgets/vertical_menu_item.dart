import 'package:app_web/constants/controllers.dart';
import 'package:app_web/constants/style.dart';
import 'package:app_web/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;

  const VerticalMenuItem({Key? key, required this.itemName, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        value ? menuController.onHover(itemName) : menuController.onHover("not hovering");
      },
      child: Obx(
        () => Container(
          color: menuController.isHovering(itemName) ? lightGrey.withOpacity(.1) : Colors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: menuController.isHovering(itemName) || menuController.isActive(itemName),
                child: Container(
                  width: 3.0,
                  height: 72.0,
                  color: dark,
                ),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: menuController.returnIconFor(itemName),
                    ),
                    if (!menuController.isActive(itemName))
                      Flexible(
                        child: CustomText(
                          text: itemName,
                          size: 18,
                          color: menuController.isHovering(itemName) ? dark : lightGrey,
                          weight: FontWeight.bold,
                        ),
                      )
                    else
                      Flexible(
                        child: CustomText(
                          text: itemName,
                          size: 18,
                          color: dark,
                          weight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
