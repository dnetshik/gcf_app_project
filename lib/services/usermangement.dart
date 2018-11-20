import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:upload_image/adminpage.dart';
import 'package:upload_image/allusers.dart';

class UserManagement
{
  storeNewuser(user, context) {
    Firestore.instance.collection('/users').add({
      'email': user.email,
      'uid': user.uid,
      //'role': user.role


    }).then((value) {
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/homepage');

    }).catchError((e) {
      print(e);
    });
  }
// authorizeAccess(BuildContext context) {
//    FirebaseAuth.instance.currentUser().then((user) {
//      Firestore.instance.collection('/users').where('uid', isEqualTo: user.uid).getDocuments().then((docs) {
//       if (docs.documents[0].exists)
//          {
//            Navigator.of(context).push(
//                new MaterialPageRoute(builder: (BuildContext context) => AdminPage()));
//             if (docs.documents[0].data['role'] == 'admin')
//              {
//                Navigator.of(context).push(
//                  new MaterialPageRoute(builder: (BuildContext context) => AdminPage()));
//              }
//              else
//                {
//                  Navigator.of(context).push(
//                      new MaterialPageRoute(builder: (BuildContext context) => AllUsersPage()));
//                }
//          }
//      });
//
//    });
  }

