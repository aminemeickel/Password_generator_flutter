import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pw_gen/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.bottom,
    ]);
    return MaterialApp(
      title: 'password Generator',
      debugShowCheckedModeBanner: false,
      routes: routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.comfortable,
      ),
      initialRoute: '/login',
      //home: HomePage(title: 'Flutter Password Generator '),
    );
  }
}
