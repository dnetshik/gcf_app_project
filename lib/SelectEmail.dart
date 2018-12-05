import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var  email;
class GetUsers extends StatefulWidget {
  @override
  _GetUsersState createState() => _GetUsersState();
}

class _GetUsersState extends State<GetUsers>
{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: new StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('users').snapshots(),
       builder: (context, snapshot) {
         var length = snapshot.data.documents.length;
         DocumentSnapshot ds = snapshot.data.documents[length - 1];
         return new DropdownButton(
             items: snapshot.data.documents.map((DocumentSnapshot document) {
               for (int i = 0; i < document.data['email'].length; i++) {
                 return new DropdownMenuItem(
                   value: document.data['email'],

                   child: new Text(document.data['email'].toString()),
                 );
               }
             }).toList(),
           value: email,
           onChanged: (value) {
               setState(() {
                 email = value;
               });
           }


         );
         // child: DropdownButton(items: null, onChanged: null),
       }),
    );
  }
}
