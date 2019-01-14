import 'dart:async';
import 'package:flutter/material.dart';
import 'addProj.dart';

class SplashPage2 extends StatefulWidget {
  @override
  _SplashPage2State createState() => _SplashPage2State();
}

class _SplashPage2State extends State<SplashPage2> {
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
                Text("Logingin..."),

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
        pageBuilder: (context, _, __) => new DashboardPage2(),
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: (context, anim1, anim2, child) {
          return new FadeTransition(
            child: child,
            opacity: anim1,
          );
        }));
  }
}