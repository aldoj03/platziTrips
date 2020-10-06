import 'package:flutter/material.dart';

class TextInputLocation extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final IconData iconData;

  TextInputLocation({Key key, this.hint, this.controller, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20.0, left: 20.0),
      child: TextField(
          controller: this.controller,
          style: TextStyle(
              fontSize: 15.0,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              hintText: hint,
              suffixIcon: Icon(this.iconData),
              fillColor: Colors.white,
              filled: true,
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ))),
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black12, blurRadius: 15.0, offset: Offset(0.0, 7.0))
      ]),
    );
  }
}
