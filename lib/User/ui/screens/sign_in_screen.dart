import 'package:flutter/material.dart';
import 'package:flutter__trips/widgets/button__green.dart';
import 'package:flutter__trips/widgets/gradient_back.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return SignInGoogleUI();
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
                onPressed: () {},
                width: 300.0,
                height: 50.0)
          ],
        )
      ],
    ));
  }
}
