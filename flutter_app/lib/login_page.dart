import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';


class LoginPage extends StatefulWidget {
  LoginPage({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormType
{
  login,
  register

}
class _LoginPageState extends State<LoginPage>
  {

    final formkey = new GlobalKey<FormState>();

    String _email;
    String _password;
    FormType _formType = FormType.login;


    bool validateAndSave()
    {
      final form = formkey.currentState;
      if (form.validate())
        {
          form.save();
          return true;
        }
        return false;
    }

    void validateAndSubmit() async
    {
      if (validateAndSave()) {
        try {
          if (_formType == FormType.login) {
            String userId = await widget.auth.signInWithEmailPassword(_email,  _password);
            //FirebaseUser user = await FirebaseAuth.instance
              //  .signInWithEmailAndPassword(email: _email, password: _password);
            print('Signed in: $userId');
          }else
            {
              String userId = await widget.auth.createUserWithEmailAndPassword(_email, _password);
             // FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
              print('Register user: $userId');
            }
            widget.onSignedIn();
        }
        catch (e)
      {
        print('Error: $e');
      }
      }

    }
    void moveToRegister()
    {
      formkey.currentState.reset();
      setState(()
      {
        _formType = FormType.register;
      });

    }
    void moveTologin()
    {
      formkey.currentState.reset();
      setState(()
      {
        _formType = FormType.login;
      });
    }
    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Gcf login'),
        ),
          body: new Center(
            child: new Container(
          padding: EdgeInsets.all(10.0),
          child: new Form(
            key: formkey,
              child: new Center(
                child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: buildInputs() +  buildsubmitButtons(),
              ),
              )
          )
        ),
          )
      );
  }

  List<Widget> buildInputs()
  {
    return [
      new TextFormField(
      decoration: new InputDecoration(labelText: 'Email'),
      validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
      onSaved: (value) => _email = value,

    ),
    new TextFormField(
      decoration: new InputDecoration(labelText: 'Password'),
      validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
      onSaved: (value) => _password = value,
      obscureText: true,
    ),
    ];
  }

    List<Widget> buildsubmitButtons() {
      if (_formType == FormType.login) {
        return [
          new RaisedButton(
          child: new Text('Login', style: new TextStyle(fontSize: 15.0)),
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
          child: new Text(
              'Create an account', style: new TextStyle(fontSize: 10.0)),
          onPressed: moveToRegister,
        ),
        ];
      } else
        {
          return [
            new RaisedButton(
            child: new Text('Create an account', style: new TextStyle(fontSize: 15.0)),
            onPressed: validateAndSubmit,
          ),
          new FlatButton(
            child: new Text(
                'Have an account? Login', style: new TextStyle(fontSize: 10.0)),
            onPressed: moveTologin,
          ),
          ];

      }
    }

}