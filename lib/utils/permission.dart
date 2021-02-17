import 'dart:io';


import 'package:alarm_loop/const/all_const.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

DateTime _currentBackPressTime;

Future<bool> checkPermission(List<Permission> listPermission) async {
  bool _isGranded = true;
  Map<Permission, PermissionStatus> statuses = await listPermission.request();
  for (var value in statuses.values) {
    if (value != PermissionStatus.granted) {
      _isGranded = false;
      break;
    }
  }
  return _isGranded;
}

Future<String> getPath(String fileName) async {
  String path = Platform.isAndroid
      ? await ExtStorage.getExternalStoragePublicDirectory(
          ExtStorage.DIRECTORY_DOWNLOADS)
      : (await getApplicationDocumentsDirectory()).path +
          Platform.pathSeparator +
          'Download';

  final savedDir = Directory(path);
  if (!(await savedDir.exists())) {
    savedDir.create();
  }

  return '$path/$fileName.pdf';
}

Future<bool> onWillPop() {
  DateTime now = DateTime.now();
  if (_currentBackPressTime == null ||
      now.difference(_currentBackPressTime) > Duration(seconds: 2)) {
    _currentBackPressTime = now;
    Fluttertoast.showToast(msg: AppStr.exitApp);
    return Future.value(false);
  }
  return Future.value(true);
}

/// delay thời gian để tránh trường hợp bấm liên tục khiến mở nhiều dialer trên ios
bool isOpenDialer(DateTime isTimeOpen) {
  DateTime now = DateTime.now();
  if (isTimeOpen == null || now.difference(isTimeOpen) > Duration(seconds: 1)) {
    isTimeOpen = now;
    return true;
  }
  return false;
}
