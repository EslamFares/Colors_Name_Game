import 'package:flutter/material.dart';

// ignore: camel_case_types
class scores extends StatelessWidget {
  const scores({
    Key key,
    @required int currentScore,
    @required int currentQuestion,
  })  : _currentScore = currentScore,
        _currentQuestion = currentQuestion,
        super(key: key);

  final int _currentScore;
  final int _currentQuestion;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: ThemeData.dark().primaryColor,
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('$_currentScore'),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      color: Colors.lightBlue,
                      height: 20,
                      width: 2,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('الأهـداف'),
                  ],
                ),
                Container(
                  color: Colors.white,
                  height: 40,
                  width: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('$_currentQuestion'),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      color: Colors.lightBlue,
                      height: 20,
                      width: 2,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('المستوى'),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}