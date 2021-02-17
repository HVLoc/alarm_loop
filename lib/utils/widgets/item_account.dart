import 'package:alarm_loop/const/all_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemUtils {
  static Widget itemLine(
      {@required String title,
      Widget leading,
      Widget trailing = const Icon(
        Icons.keyboard_arrow_right,
        size: 25,
        color: AppColors.hintTextSolidColor,
      ),
      Function func}) {
    return Ink(
      color: AppColors.bgInputTextColor,
      child: ListTile(
        leading: leading,
        title: Text(
          title,
          style: Get.textTheme.bodyText2.copyWith(color:AppColors.hintTextSolidColor),
        ),
        onTap: func,
        trailing: trailing,
      ),
    );
  }

  static Widget buildDivider({double height = 1.0}) {
    return Container(
      color: Get.theme.cardColor,
      height: 1,
      width: Get.width,
      child: Divider(
        thickness: height,
        indent: 20,
        endIndent: 20,
      ),
    );
  }

  static Widget partItem(
      {@required IconData icons, @required String title, int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Row(
        children: [
          Expanded(child: Icon(icons)),
          Expanded(flex: 4, child: Text(title)),
        ],
      ),
    );
  }
}
