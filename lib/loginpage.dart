import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'adminpage.dart';
import 'allusers.dart';
import 'services/usermangement.dart';
import 'addProj.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';



authorizeAccess(BuildContext context) {
  FirebaseAuth.instance.currentUser().then((user) {
    Firestore.instance.collection('/users')
        .where('uid', isEqualTo: user.uid)
        .getDocuments()
        .then((docs) {
      if (docs.documents[0].exists) {
        if (docs.documents[0].data['role'] == 'admin') {
          Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context) => DashboardPage2()));
        }
        else if(docs.documents[0].data['role'] == 'user') {
          Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context) => AllUsersPage()));
        }
        else
          {
            print("Not authorized");
          }
      }
    });
  });
}

//
//class HandleLogin extends StatefulWidget {
//
//  @override
//  _HandleLoginState createState() => _HandleLoginState();
//
//}
//
//class _HandleLoginState extends State<HandleLogin> {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//      Future<FirebaseUser> handleLogin(String email, String password) async {
//    FirebaseUser user;
//    try {
//      user = await FirebaseAuth.instance.signInWithEmailAndPassword(
//          email: email, password: password);
//      print("done logging in");
//      print(user.uid);
//
//      print("new user set");
//      return user;
//    } catch (err) {
//      print(err.toString());
//    }
//    finally {
//      if (user != null) {
//        //Log in was successfull!
//        setState(() {
//          //FirebaseUser = user;
//        });
//      }
//      else {
//        //Log in was unsuccessfull!
//      }
//    }
//  }
//    return null;
//  }
//
//
//}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}
String validatePasswordl(String value) {
  Pattern pattern =
      r'^(([a-zA-Z\-0-9])+[a-zA-Z])$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Password';
  else
    return null;
}

class _LoginPageState extends State<LoginPage> {
  final formkey = new GlobalKey<FormState>();

  String _email;
  String _password;

  checkFields() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  loginUser() {
    if (checkFields()) {
      //Perform Login
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password)
          .then((user) {
        print('Signed in as ${user.uid}');
       //Navigator.of(context).pushReplacementNamed('/dashboard');

        authorizeAccess(context);
      }).catchError((e) {
        print(e);
      });
    }
  }
final bool isvalidemail = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Gcf app'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(25.0),
              child: new Form(
                key: formkey,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 70.0,
                     // backgroundImage: new AssetImage('assets/logotwo.png'),
                    ),
                    SizedBox(height: 15.0),
                    new TextFormField(
                          decoration: const InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: validateEmail,
                          onSaved: (String val)
                          {
                          _email = val;
                          }

//                      decoration: InputDecoration(
//                        hintText: 'Email',
//                        contentPadding:
//                        EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                        border: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(20.0)),
//                      ),
////                      validator: (value) =>
////                      value.isEmpty ? 'Email is blank' : null,
////                      onSaved: (value) => _email = value,


    ),
                    SizedBox(height: 15.0),
                    new TextFormField(
                        decoration: const InputDecoration(labelText: 'Password'),
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        validator: (value) =>
                        value.isEmpty ? 'Password is blank' : null,
                        onSaved: (String val)
                        {
                          _password = val;
                        }


//                      decoration: InputDecoration(
//                        hintText: 'Password',
//                        contentPadding:
//                        EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                        border: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(20.0)),
//                      ),
//                      obscureText: true,
//                      validator: (value) =>
//                      value.isEmpty ? 'Password is blank' : null,
//                      onSaved: (value) => _password = value,
                    ),

                    SizedBox(height: 15.0),
                    new Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.lightBlueAccent,
                        elevation: 7.0,
                        child: MaterialButton(
                          minWidth: 500.0,
                          height: 40.0,
                          onPressed: loginUser,
                          color: Colors.lightBlueAccent,
                          child: Text(
                            'Log In',
                            style: new TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    new Text('Don\'t have an account?'),
                    new Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.lightBlueAccent,
                        elevation: 7.0,
                        child: MaterialButton(
                          minWidth: 500.0,
                          height: 40.0,
                          onPressed: () {
                            Navigator.of(context).pushNamed('/signup');
                          },
                          color: Colors.lightBlueAccent,
                          child: Text(
                            'Signup',
                            style: new TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}