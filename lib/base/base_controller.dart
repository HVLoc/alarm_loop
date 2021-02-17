
import 'package:alarm_loop/const/all_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'base.dart';

class BaseGetxController extends GetxController {
  RxBool isShowLoading = false.obs;
  RxBool isLoadedSuccess = false.obs;
  String errorContent = '';


  void showLoading() {
    isShowLoading.value = true;
  }

  void hideLoading() {
    isShowLoading.value = false;
    isLoadedSuccess.value = true;
  }

  

  Future<void> showSnackBarError(String message,
      {String title = AppStr.error}) async {
    Get.showSnackbar(GetBar(
      messageText: Text(
        message,
        style: Get.textTheme.bodyText1,
      ),
      message: message,
      duration: 2.seconds,
    ));
  }
}
