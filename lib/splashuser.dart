import 'dart:async';
import 'package:flutter/material.dart';
import 'package:upload_image/allusers.dart';
import 'user/projectSpecDetails.dart';


class Splashuser extends StatefulWidget {
  @override
  _SplashuserState createState() => _SplashuserState();
}

class _SplashuserState extends State<Splashuser> {
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
        pageBuilder: (context, _, __) => new AllUsersPage(),
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: (context, anim1, anim2, child) {
          return new FadeTransition(
            child: child,
            opacity: anim1,
          );
        }));
  }
}