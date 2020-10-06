import 'package:flutter/material.dart';
import 'package:flutter__trips/Place/model/place.dart';

class UserApp{
  final  String uid;
  final String name;
  final String email;
  final String photoUrl;
  final List<Place> myPlaces;
  final List<Place> myFavoritePlaces;


  UserApp({
    Key key,
    this.uid,
    this.name, 
    this.email, 
    this.photoUrl,
    this.myPlaces,
    this.myFavoritePlaces});
  
}