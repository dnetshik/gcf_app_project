import 'package:flutter/material.dart';

import 'loginpage.dart';
import 'signuppage.dart';
import 'homepage.dart';
import 'uploadsiteimages.dart';
import 'addProj.dart';
import 'utils/addstep.dart';
import 'projectdetails.dart';
import 'utils/tabs.dart';
import 'uploadreciepts.dart';

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
        buttonColor: Colors.green[600],
        backgroundColor: Colors.white70,
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: "Hind"),
          body2: TextStyle(fontSize: 15.0, fontFamily: 'Hind')
        )
      ),
      home: new LoginPage(),
      routes: <String, WidgetBuilder>{
        '/dashboard': (BuildContext context) => new DashboardPage(),
        '/landingpage': (BuildContext context) => new MyApp(),
        '/signup': (BuildContext context) => new SignupPage(),
        '/uploadsiteimages': (BuildContext context) => new UploadSiteImagesPage(),
        '/addProj': (BuildContext context) => new DashboardPage2(),
        '/addstep': (BuildContext context) => new MyHome(),
        '/projectdetails': (BuildContext context) => new ProjectDetailsPage(),
        '/tabs': (BuildContext context) => new Tabs(),
        '/uploadreciepts': (BuildContext context) => new UploadReceiptsPage(),

      },
    );
  }
}

