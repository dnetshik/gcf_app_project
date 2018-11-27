import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'services/usermangement.dart';

// import 'home_page.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}


class _SignupPageState extends State<SignupPage> {
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
  createUser() {
    if (checkFields()) {
      //Perform Login
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .then((user) {
        //print('Signed in ${user.uid}');
        UserManagement().storeNewuser(user, context);
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed('/dashboard');
      }).catchError((e) {
        print(e);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sign up'),
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
                      backgroundImage: new AssetImage('assets/logotwo.png'),
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
//                      validator: (value) =>
//                      value.isEmpty ? 'Email is blank' : null,
//                      onSaved: (value) => _email = value,
                    ),
                    SizedBox(height: 15.0),
                    new TextFormField(
//                      decoration: InputDecoration(
//                        hintText: 'Password',
//                        contentPadding:
//                        EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                        border: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(20.0)),
//
//
//
//
//
//                      ),

                      decoration: const InputDecoration(labelText: 'Password'),
                      keyboardType: TextInputType.text,
                      validator: validatePasswordl,
                      onSaved: (String val)
                      {
                        _password = val;
                      }
//                      obscureText: true,
//                      validator: (value) =>
//                      value.length < 6 ? "Password should have at least 6 characters" : null,
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
                          onPressed: createUser,
                          color: Colors.lightBlueAccent,
                          child: Text(
                            'Register',
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
