//import 'package:flutter/material.dart';
//
//
//class SplashPage extends StatefulWidget {
//  @override
//  _SplashPageState createState() => _SplashPageState();
//}
//
//class _SplashPageState extends State<SplashPage>
//{
//  bool _progressBarActive = true;
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: new AppBar(
//      title: Text('Yea'),
//      ),
//      body:  _progressBarActive == true?const CircularProgressIndicator() :
//      new Text('Loading...'),
//
//    );
//  }
//
//}


import 'dart:async';
import 'package:flutter/material.dart';
import 'loginpage.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    super.initState();
    new Timer(const Duration(seconds: 5), onClose);
  }
 bool  _progressBarActive = true;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Align(
          alignment: FractionalOffset.center,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

             _progressBarActive == true?const CircularProgressIndicator() : Text("Loading..."),

              new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Please wait..."),
                   // Image.asset('images/logogreen.png',alignment: Alignment.topRight,height: 45.0, ),

                  ],

              )
            ],
          ),
      ),
    );
  }

  void onClose() {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        maintainState: true,
        opaque: true,
        pageBuilder: (context, _, __) => new LoginPage(),
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: (context, anim1, anim2, child) {
          return new FadeTransition(
            child: child,
            opacity: anim1,
          );
        }));
  }
}