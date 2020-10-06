import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User> signIng() async {
    GoogleSignInAccount googleSignInAccount = await this.googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    UserCredential userCredential = await this._auth.signInWithCredential(
        GoogleAuthProvider.credential(
            idToken: gSA.idToken, accessToken: gSA.accessToken));

    return userCredential.user;
  }

  get firebaseInstance{
    return this._auth;
  }

  signOut()  {
    this._auth.signOut().then((value) => print('Logout'));
    this.googleSignIn.signOut().then((value) => print('Logout Gmail'));
  }
}
