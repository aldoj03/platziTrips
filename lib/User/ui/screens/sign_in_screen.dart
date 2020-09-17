import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter__trips/User/bloc/bloc_user.dart';
import 'package:flutter__trips/User/repository/auth_repository.dart';
import 'package:flutter__trips/platzi_trips_cupertino.dart';
import 'package:flutter__trips/widgets/button__green.dart';
import 'package:flutter__trips/widgets/gradient_back.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    this.userBloc = BlocProvider.of(context);

    return this._handlreCurrentSesion();
  }

  Widget _handlreCurrentSesion() {
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(!snapshot.hasData || snapshot.hasError){
          return this.SignInGoogleUI();
        }
        return PlatziTripsCupertino();
      },
    );
  }

  Widget SignInGoogleUI() {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        GradientBack('', null),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Welcome \n This is your Travel App',
                  style: TextStyle(
                      fontSize: 37.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
            ButtonGreen(
                text: 'Login with Gmail',
                onPressed: () {
                  this.userBloc.signIn().then((User user) =>
                      print("El usuario es ${user.displayName}"));
                },
                width: 300.0,
                height: 50.0)
          ],
        )
      ],
    ));
  }
}
