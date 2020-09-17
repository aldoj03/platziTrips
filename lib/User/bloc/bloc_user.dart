import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter__trips/User/repository/auth_repository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRespository();

  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User> get authStatus => streamFirebase;

  Future<User> signIn() {
    return _auth_repository.signInFirebase();
  }

  signOut() => this._auth_repository.signOut();
  

  @override
  void dispose() {
    // TODO: implement dispose
  }


}
