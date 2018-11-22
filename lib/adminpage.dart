import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'utils/utils.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
        centerTitle: true,


      ),
        drawer: addDrawer(context),

body: Center(
  child: new OutlineButton(
  borderSide: BorderSide(
      color: Colors.red, style: BorderStyle.solid, width: 3.0),
  child: Text('Upload'),
  onPressed: () {
    Navigator.of(context).pushReplacementNamed('/uploadpicture');
  }
),),
    );
  }
}