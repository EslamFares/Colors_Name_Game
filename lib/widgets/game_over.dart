
import 'dart:math';

import 'package:flutter/material.dart';

import '../home_page.dart';

class GameOver extends StatelessWidget {
  const GameOver({
    Key key,
    @required int currentScore,
    @required List<Question> questions, this.playAgain,
  })  : _currentScore = currentScore,
        _questions = questions,
        super(key: key);
  final int _currentScore;
  final Function playAgain;
  final List<Question> _questions;
  @override
  Widget build(BuildContext context) {
    String emoje = '';
    switch (_currentScore) {
      case 0:
        emoje = '👎';
        break;
      case 1:
        emoje = '😞';
        break;
      case 2:
        emoje = ' 🙂';
        break;
      case 3:
        emoje = '😊';
        break;
      case 4:
        emoje = ' ☺️ ';
        break;
      case 5:
        emoje = '👍';
        break;
      case 6:
        emoje = ' ✌️ ';
        break;
      case 7:
        emoje = '👏';
        break;
      default:
        emoje = '👍';
        break;
    }
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 70),
            height: 150,
            width: MediaQuery.of(context).size.width / 1.5,
            decoration: BoxDecoration(
                color: ThemeData.dark().primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        emoje,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'النتيجة',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '$_currentScore / ${_questions.length}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Container(
            width: MediaQuery.of(context).size.width / 1.2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'اللعب مرة أخرى ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: 15,),
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 85,vertical: 8),
                    color: Colors.pink,
                    shape: StadiumBorder(),
                    borderSide: BorderSide(color: Colors.blue, width: 4),
                    onPressed:playAgain,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Transform.rotate(
                            angle:  pi / 8,
                            child: Icon(Icons.replay)),
                        SizedBox(width: 15,),
                        Text('مرة أخرى',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}