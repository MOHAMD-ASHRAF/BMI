import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
 //  double radius = 0.0,
  required  VoidCallback function,
  required String text,
})=> Container(
  height: 40,
  color: background,
  width: width,
  child: MaterialButton(
    onPressed: function,
    child: Text(
      isUpperCase ? text.toUpperCase() :text,
      style: (
          TextStyle(
            color: Colors.white,
          )
      ),
    ),
  ),
);

