import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter__trips/Place/model/place.dart';
import 'package:flutter__trips/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'profile_place.dart';

class ProfilePlacesList extends StatelessWidget {
  UserBloc userBloc;


  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: StreamBuilder(
          stream: this.userBloc.placesStream,
          builder: (context, AsyncSnapshot snapshot) {
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> queryDocumentSnapshot = querySnapshot.docs;
            
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.done:
                return Column(
                  children: userBloc.buidPlaces(queryDocumentSnapshot),
                );

              case ConnectionState.active:
              
                return Column(
                  children: userBloc.buidPlaces(queryDocumentSnapshot),
                );
                
              case ConnectionState.none:
                return CircularProgressIndicator();
            }
          }),
    );
  }
}
