import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter__trips/Place/model/place.dart';
import 'package:flutter__trips/Place/repository/firebase_storage_repository.dart';
import 'package:flutter__trips/User/model/user.dart';
import 'package:flutter__trips/User/repository/auth_repository.dart';
import 'package:flutter__trips/User/repository/cloud_firestore_api.dart';
import 'package:flutter__trips/User/repository/cloud_firestore_repositiry.dart';
import 'package:flutter__trips/User/ui/widgets/profile_place.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRespository();

  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User> get authStatus => streamFirebase;
  User currentUser()  {
    return FirebaseAuth.instance.currentUser;
  }

  Future<User> signIn() {
    return _auth_repository.signInFirebase();
  }

  signOut() => this._auth_repository.signOut();

  final _cloudFirestoreRepository = CloudFirestoreRespository();
  void updateUserData(UserApp user) =>
      _cloudFirestoreRepository.updateUserData(user);

  final _firebaseStorageRepository = FirebaseStorageRepository();
  Future<StorageUploadTask> uploadFIle(path, file) =>
      _firebaseStorageRepository.uploadFile(path, file);

  Future<void> updatePlace(Place place) =>
      _cloudFirestoreRepository.updatePlaceData(place);

  Stream<QuerySnapshot> placesListStream = FirebaseFirestore.instance.collection(CloudFirestoreAPI().places).snapshots();
  Stream<QuerySnapshot> get placesStream => placesListStream;

  List<ProfilePlace> buidPlaces(List<QueryDocumentSnapshot> placesListSnapshot) => _cloudFirestoreRepository.buidPlaces(placesListSnapshot);



  @override
  void dispose() {
    // TODO: implement dispose
  }
}
