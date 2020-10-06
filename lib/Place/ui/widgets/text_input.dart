import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hint;
  final TextInputType inputType;
  final TextEditingController controller;

  int maxLines = 1;

  TextInput(
      {Key key, this.hint, this.inputType, this.controller, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20.0, left: 20.0),
      child: TextField(
        controller: this.controller,
        keyboardType: this.inputType,
        maxLines: this.maxLines,
        style: TextStyle(
            fontSize: 15.0,
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFe5e5e5),
            border: InputBorder.none,
            hintText: this.hint,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFe5e5e5)),
              borderRadius: BorderRadius.all(Radius.circular(9.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFe5e5e5)),
              borderRadius: BorderRadius.all(Radius.circular(9.0)),
            )),
      ),
    );
  }
}
