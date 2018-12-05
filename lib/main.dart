import 'package:flutter/material.dart';

import 'loginpage.dart';
import 'signuppage.dart';
import 'homepage.dart';
import 'uploadpicture.dart';
import 'addProj.dart';
import 'SelectEmail.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[400],
        accentColor: Colors.greenAccent[600],
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: "Hind"),
          body2: TextStyle(fontSize: 15.0, fontFamily: 'Hind')
        )
      ),
      home: new LoginPage(),
      routes: <String, WidgetBuilder>{
        '/dashboard': (BuildContext context) => new DashboardPage(),
        '/landingpage': (BuildContext context) => new MyApp(),
        '/signup': (BuildContext context) => new SignupPage(),
        '/uploadpicture': (BuildContext context) => new UploadPicturePage(),
        '/addProj': (BuildContext context) => new DashboardPage2(),
        '/SelectEmail': (BuildContext context) => new GetUsers(),

      },
    );
  }
}

