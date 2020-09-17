import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter__trips/User/repository/firebase_auth_api.dart';


class AuthRespository {

  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<User> signInFirebase() => _firebaseAuthAPI.signIng();

  signOut() =>this._firebaseAuthAPI.signOut();
  

}