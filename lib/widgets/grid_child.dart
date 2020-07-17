import 'package:flutter/material.dart';

import '../home_page.dart';

// ignore: non_constant_identifier_names
Widget GridChild({@required Option option, Function(bool) onClick}) {
  return GestureDetector(
    onTap: () {
      onClick(option.isCorrectAnswer);
    },
    child: Material(
        elevation: 10,
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
        child: Container(
            margin: EdgeInsets.all(10),
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                color: ThemeData.dark().scaffoldBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            child: Center(
                child: Text(
                  option.text,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )))),
  );
}