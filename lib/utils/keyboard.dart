import 'package:get/get.dart';

class KeyBoard {
  static void hide() {
    // Get.focusScope.requestFocus(FocusNode());
    Get.focusScope.unfocus();
  }

  static bool keyboardIsVisible() {
    return Get.mediaQuery.viewInsets.bottom != 0.0;
  }
}
