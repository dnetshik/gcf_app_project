import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

abstract class BaseAuth
{
  Future<String> signInWithEmailPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String passsword);
  Future<String> currentUser();
  Future<void> signOut();
}
class Auth implements BaseAuth
{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signInWithEmailPassword(String email, String password) async
  {
    FirebaseUser user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }
  Future<String> createUserWithEmailAndPassword(String email, String passsword) async
  {
    FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: passsword);
    return user.uid;
  }

  Future<String> currentUser() async
  {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }

  Future<void> signOut() async
  {

    return FirebaseAuth.instance.signOut();
  }

}