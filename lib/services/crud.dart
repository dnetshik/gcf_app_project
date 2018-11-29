import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProjectMedthods
{
    bool isLoggedIn()
    {
      if (FirebaseAuth.instance.currentUser() != null)
      {
        return true;
      } else
        {
        return false;
        }
}

Future<void> addData(ProjectData) async
{
  if (isLoggedIn())
  {
    Firestore.instance.collection('projects').add(ProjectData).catchError((e)
    {
      print(e);
    });
  } else
    {
      print('You need to be logged in');
    }
}

getData() async
  {
    return await Firestore.instance.collection('projects').getDocuments();
  }
  getUsers() async
  {
    return await Firestore.instance.collection('users').getDocuments();
  }
}