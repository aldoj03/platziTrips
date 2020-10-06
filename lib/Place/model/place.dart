import 'package:flutter/material.dart';
import 'package:flutter__trips/User/model/user.dart';

class Place{
  String id;
  String name;
  String description;
  int likes;
  UserApp userOwner;
  String urlImage;

  Place({Key key, this.id, this.name, this.description, this.likes, this.urlImage});
}