import 'dart:async';
import 'package:flutter/material.dart';
import 'projectdetails.dart';


class SplashPage3 extends StatefulWidget {
  @override
  _SplashPage3State createState() => _SplashPage3State();
}

class _SplashPage3State extends State<SplashPage3> {
  @override
  initState() {
    super.initState();
    new Timer(const Duration(seconds: 2), onClose);
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
                //Text("Loading..."),

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
        pageBuilder: (context, _, __) => new ProjectDetailsPage(),
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: (context, anim1, anim2, child) {
          return new FadeTransition(
            child: child,
            opacity: anim1,
          );
        }));
  }
}