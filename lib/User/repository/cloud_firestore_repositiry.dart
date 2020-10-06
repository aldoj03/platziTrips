import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter__trips/Place/model/place.dart';
import 'package:flutter__trips/User/model/user.dart';
import 'package:flutter__trips/User/repository/cloud_firestore_api.dart';
import 'package:flutter__trips/User/ui/widgets/profile_place.dart';

class CloudFirestoreRespository {
  
  final _cloudFirestoreAPI =  CloudFirestoreAPI();

  void updateUserData(UserApp user) => _cloudFirestoreAPI.updateUserData(user);

  Future<void> updatePlaceData(Place place) => this._cloudFirestoreAPI.updatePlaceData(place);

  List<ProfilePlace> buidPlaces(List<QueryDocumentSnapshot> placesListSnapshot) => _cloudFirestoreAPI.buidPlaces(placesListSnapshot);

  
  }