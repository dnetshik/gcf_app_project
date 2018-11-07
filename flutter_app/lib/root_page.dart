import 'package:flutter/material.dart';
import 'login_page.dart';
import 'auth.dart';
import 'home_page.dart';

class RootPage extends StatefulWidget
{
  RootPage({this.auth});
  final BaseAuth auth;
  @override
  State<StatefulWidget> createState() => _RootPageState();

}

enum AuthStatus
{
  notSignedIn,
  signedIn
}

class _RootPageState extends State<RootPage>
{
  AuthStatus _authStatus = AuthStatus.notSignedIn;

  @override
  void initState()
  {
    // TODO: implement initState

    super.initState();
    widget.auth.currentUser().then((userId)
    {
      setState(() {
        _authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }

  void _signedIn()
  {
    setState(() {
      _authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut()
  {
    _authStatus =AuthStatus.signedIn;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    switch (_authStatus)
    {
      case AuthStatus.notSignedIn:
        return new LoginPage(auth: widget.auth,
        onSignedIn: _signedIn,);
      case AuthStatus.signedIn:
        return new HomePage(
          auth: widget.auth,
          onSignedOut: _signedOut,

        );
    }
    return new LoginPage(auth: widget.auth);
  }
}