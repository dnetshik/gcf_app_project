import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

Form addProjectForm(context) {
  key: _formKey;
  child:
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
            validator: (value)
  {
  if (value.isEmpty)
  {
  return 'Please enter some text';
  }
  }
  ,
  )
  ,
  Padding
  (
  padding
      :
  const
  EdgeInsets
      .
  symmetric
  (
  vertical
      :
  16.0
  )
  ,
  child
      :
  RaisedButton
  (
  onPressed
      :
  (
  )
  {
// Validate will return true if the form is valid, or false if
// the form is invalid.
  if (_formKey.currentState.validate())
  {
// If the form is valid, we want to show a Snackbar
  Scaffold.of(context)
      .showSnackBar(SnackBar(content: Text('Processing Data')));
  }
  }
  ,
  child: Text('Submit')

  )
  ,
  )
  ,
  ]
  ,
  );

}