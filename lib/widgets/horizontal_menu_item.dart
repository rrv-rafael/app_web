import 'package:app_web/constants/controllers.dart';
import 'package:app_web/constants/style.dart';
import 'package:app_web/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;

  const HorizontalMenuItem({Key? key, required this.itemName, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
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
                  width: 6.0,
                  height: 40.0,
                  color: dark,
                ),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
              ),
              SizedBox(
                width: _width / 80.0,
              ),
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
        ),
      ),
    );
  }
}
