import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

  class _LoginPageState extends State<LoginPage>
  {

    final forkey = new GlobalKey<FormState>();

    String _email;
    String _password;


    void validateAndSave()
    {
      final form = forkey.currentState;
      if (form.validate())
        {
          form.save();
          print('Form is valid. email $_email, password $_password');
        } else
          {
            print('Form is invalid. email $_email, password $_password');
          }
    }
    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Gcf login'),
        ),
        body: new Container(
          padding: EdgeInsets.all(10.0),
          child: new Form(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
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
                  new RaisedButton(
                    child: new Text('Login', style: new TextStyle(fontSize: 15.0)),
                    onPressed: validateAndSave ,
                  )
                ],
              ))
        )
      );
  }


}