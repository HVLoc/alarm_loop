import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_controller.dart';

abstract class BaseGetWidget<T extends BaseGetxController> extends GetView<T> {
  const BaseGetWidget({Key key}) : super(key: key);

  Widget buildWidgets();

  @override
  Widget build(BuildContext context) {
    return buildWidgets();
  }
}
