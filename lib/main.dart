import 'package:alarm_loop/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'base/base.dart';
import 'const/all_const.dart';
import 'home/home_page.dart';

void main() {
  _init();
}

void _init() async {
  runApp(Application());
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.darkAccentColor,
      statusBarColor: AppColors.darkAccentColor,
    ));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Application
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: KeyBoard.hide,
      child: GetMaterialApp(
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
        supportedLocales: [const Locale('vi')],
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child,
          );
        },

        debugShowCheckedModeBanner: false,
        title: AppStr.appName,
        getPages: route,
        theme: getThemeByAppTheme(AppDefaultTheme),
        darkTheme: getThemeByAppTheme(AppThemeDark),
        logWriterCallback: localLogWriter,
        initialRoute: '/',
        // routes: routes,
      ),
    );
  }

  var route = [
    GetPage(
      name: '/',
      page: () => HomePage(),
    ),
  ];

  void localLogWriter(String text, {bool isError = false}) {
    print('** ' + text + ' [' + isError.toString() + ']');
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
