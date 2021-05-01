import 'package:flutter/cupertino.dart';
import 'package:flutter_pw_gen/pages/home.dart';

import 'core/preference.dart';
import 'pages/loginPage.dart';

var routes = {
  '/': (builder) => HomePage(),
  '/login': (builder) => splashScreen(),
};
Widget splashScreen() => FutureBuilder(
      builder: (builder, snap) {
        if (snap.hasData) {
          if (snap.data == 'true') {
            return HomePage();
          }
        }
        return LoginPage();
      },
      future: PreferenceDriver.instance.read('isLogin'),
    );
