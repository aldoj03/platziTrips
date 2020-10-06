import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter__trips/Place/model/place.dart';
import 'package:flutter__trips/User/model/user.dart';
import 'package:flutter__trips/User/repository/firebase_auth_api.dart';
import 'package:flutter__trips/User/ui/widgets/profile_place.dart';

class CloudFirestoreAPI {
  final String users = "users";
  final String places = "places";
  final FirebaseAuth _auth = FirebaseAuthAPI().firebaseInstance;

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void updateUserData(UserApp user) async {
    DocumentReference ref = this._db.collection(this.users).doc(user.uid);

    return await ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoUrl': user.photoUrl,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lasSignIn': DateTime.now()
    }, SetOptions(merge: true));
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = this._db.collection(this.places);

    String uid = _auth.currentUser.uid;
    DocumentReference _userRef = this._db.doc("${this.users}/$uid");
    await refPlaces
        .add({
          'name': place.name,
          'description': place.description,
          'likes': place.likes,
          'userOwner': _userRef,
          "urlImage": place.urlImage
        })
        .then((DocumentReference dr) => dr.get())
        .then((DocumentSnapshot snapshot) {
          final String key = snapshot.id;
          return _userRef.update({
            "myPlaces":
                FieldValue.arrayUnion([this._db.doc("${this.places}/$key")])
          }).then((value) => print('place guardado'));
        });
  }

  List<ProfilePlace> buidPlaces(
      List<QueryDocumentSnapshot> placesListSnapshot) {
    List<ProfilePlace> profilePlaces = [];
    placesListSnapshot.forEach((e) => profilePlaces.add(ProfilePlace(Place(
          name: e.data()['name'],
          description: e.data()['description'],
          likes: e.data()['likes'],
          urlImage: e.data()['urlImage'],
        ))));

    return profilePlaces;
  }
}
