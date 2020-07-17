

import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  final String title;
  final Color color;
  QuestionText({@required this.title, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 25,
          letterSpacing: 1.2,
          fontWeight: FontWeight.bold,
          color: color),
    );
  }
}
