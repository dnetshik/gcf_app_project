import 'package:flutter/material.dart';

import 'loginpage.dart';
import 'signuppage.dart';
import 'homepage.dart';
import 'uploadpicture.dart';
import 'addProj.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      routes: <String, WidgetBuilder>{
        '/dashboard': (BuildContext context) => new DashboardPage(),
        '/landingpage': (BuildContext context) => new MyApp(),
        '/signup': (BuildContext context) => new SignupPage(),
        '/uploadpicture': (BuildContext context) => new UploadPicturePage(),
        '/addProj': (BuildContext context) => new DashboardPage2(),

      },
    );
  }
}

