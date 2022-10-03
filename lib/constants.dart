import 'package:flutter/material.dart';

const kBackgroundColor = Color.fromARGB(255, 20, 33, 44);
const kPrimaryColor = Color(0xffED802E);

const List<BoxShadow> kDarkShadow = [
  // BoxShadow(
  //   color: Colors.white12,
  //   blurRadius: 5,
  //   spreadRadius: 1,
  //   offset: Offset(1, -2),
  // ),
  BoxShadow(
    color: Colors.black38,
    blurRadius: 2,
    spreadRadius: 1.0,
    offset: Offset(-1, 2),
  ),
];

const List<BoxShadow> kLightShadow = [
  BoxShadow(
    color: Colors.black12,
    blurRadius: 1,
    spreadRadius: 1,
    offset: Offset(-1, 1.5),
  ),
];
