import 'package:flutter/material.dart';
import 'addProj.dart';

class AllUsersPage extends StatefulWidget {
  @override
  _AllUsersPageState createState() => _AllUsersPageState();
}

class _AllUsersPageState extends State<AllUsersPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('All Users'),
      ),
      body: Center(
        child: new OutlineButton(
            borderSide: BorderSide(
                color: Colors.red, style: BorderStyle.solid, width: 3.0),
            child: Text('working'),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/addProj');
            }
        ),),
    );
  }
}