
import 'package:alarm_loop/const/all_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowPopup {
  static void _showDialog(Widget dialog, bool isActiveBack) {
    Get.dialog(
      WillPopScope(
        onWillPop: () => onBackPress(isActiveBack),
        child: dialog,
      ),
      barrierDismissible: false,
    ).then((value) => numberOfDialogs--);
    numberOfDialogs++;
  }

  /// local vars
  static int numberOfDialogs = 0;

  static Future<bool> onBackPress(bool isActiveBack) {
    return Future.value(isActiveBack);
  }

  static void dismissDialog() {
    if (numberOfDialogs > 0) {
      Get.back();
    }
  }

  /// Hiển thị loading
  ///
  /// `isActiveBack` có cho phép back từ bàn phím Android khi loading hay không, default = true
  void showLoadingWave({bool isActiveBack = true}) {
    _showDialog(getLoadingWidget(), isActiveBack);
  }

  static Widget getLoadingWidget() {
    return Center(
      child: CupertinoActivityIndicator(),
    );
  }

  /// Hiển thị dialog thông báo với nội dung cần hiển thị
  ///
  /// `funtion` hành động khi bấm đóng
  ///
  /// `isActiveBack` có cho phép back từ bàn phím Android hay không, default = true
  ///
  /// `isChangeContext` default true: khi gọi func không close dialog hiện tại (khi chuyển sang màn mới thì dialog hiện tại sẽ tự đóng)
  static void showDialogNotification(
    String content, {
    bool isActiveBack = true,
    Function function,
    String nameAction,
  }) {
    _showDialog(
        Dialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 15, bottom: 10),
                  child: Icon(
                    _buildIconDialog(content),
                    size: AppDimens.sizeDialogNotiIcon,
                    color: Colors.blueAccent,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  constraints: BoxConstraints(maxHeight: 200),
                  child: SingleChildScrollView(
                    child: Text(
                      content,
                      style: TextStyle(fontSize: AppDimens.fontMedium),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      textScaleFactor: 1,
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                ),
                Container(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      dismissDialog();
                      if (function != null) {
                        function();
                      }
                    },
                    // highlightColor: Colors.transparent,
                    // splashColor: Colors.transparent,
                    child: Text(
                      nameAction ?? AppStr.close,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                      textScaleFactor: 1,
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        isActiveBack);
  }

  static void showErrorMessage(String error) {
    showDialogNotification(error, isActiveBack: false);
  }

  static IconData _buildIconDialog(String errorStr) {
    IconData iconData;
    switch (errorStr) {
      case AppStr.errorConnectTimeOut:
        iconData = Icons.alarm_off;
        break;
      case AppStr.error400:
      case AppStr.error401:
      case AppStr.error404:
      case AppStr.error502:
      case AppStr.error503:
      case AppStr.errorInternalServer:
        iconData = Icons.warning;
        break;
      case AppStr.errorConnectFailedStr:
        iconData = Icons.signal_wifi_off;
        break;
      default:
        iconData = Icons.notifications_none;
    }
    return iconData;
  }

  static void showDialogConfirm(String content,
      {@required Function confirm,
      @required String actionTitle,
      bool isActiveBack = true,
      String title,
      bool isAutoCloseDialog = false}) {
    _showDialog(
        Dialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    title ?? AppStr.notify,
                    textScaleFactor: 1,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: AppDimens.fontBiggest,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  constraints: BoxConstraints(maxHeight: 200),
                  child: SingleChildScrollView(
                    child: Text(
                      content,
                      style: Get.textTheme.bodyText1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      textScaleFactor: 1,
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                ),
                Container(
                  width: double.infinity,
                  height: AppDimens.btnMedium,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextButton(
                          onPressed: dismissDialog,
                          child: Text(
                            AppStr.cancel,
                            textScaleFactor: 1,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: AppDimens.fontBig),
                          ),
                        ),
                      ),
                      VerticalDivider(
                        width: 1,
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            dismissDialog();
                            if (confirm != null) {
                              confirm();
                            }
                          },
                          child: Text(
                            actionTitle,
                            textScaleFactor: 1,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppDimens.fontBig,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        isActiveBack);
  }
}
