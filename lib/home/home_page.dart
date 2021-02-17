import 'package:alarm_loop/base/base.dart';
import 'package:alarm_loop/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends BaseGetWidget<HomeController> {
  @override
  HomeController get controller => Get.put(HomeController());

  @override
  Widget buildWidgets() {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              'asdsdsdsdsdsdsdsdsdsd',
              style: Get.textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
