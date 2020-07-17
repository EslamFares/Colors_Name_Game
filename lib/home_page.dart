import 'package:colors_names_game/widgets/game_over.dart';
import 'package:colors_names_game/widgets/grid_child.dart';
import 'package:colors_names_game/widgets/question_text.dart';
import 'package:colors_names_game/widgets/scores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Question {
  final String title;
  final List<Option> options;
  final Color color;
  Question(
      {@required this.color, @required this.title, @required this.options});
}

class Option {
  final String text;
  final bool isCorrectAnswer;
  Option(this.text, [this.isCorrectAnswer = false]);
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentQuestion = 0;
  int _currentScore = 0;
  _onOptionClicked(bool isCorrectAnswer) {
    if (isCorrectAnswer) _currentScore++;
    print('Score:$_currentScore');
    setState(() {
      _currentQuestion++;
    });
    print('Question num: $_currentQuestion');
  }
playAgain(){
setState(() {
  _currentQuestion=0;_currentScore=0;
});
}
  @override
  Widget build(BuildContext context) {
    Question question1 = Question(color: Colors.amber, title: 'أحمر', options: [
      Option("أصفر", true),
      Option("وردى"),
      Option("أسود"),
      Option("رمادى"),
      Option("أبيض"),
      Option("أحمر"),
      Option("أزرق"),
      Option("برتقالى"),
      Option("أخضر"),
    ]);
    Question question2 = Question(color: Colors.green, title: 'أزرق', options: [
      Option(
        "أحمر",
      ),
      Option(
        "أسود",
      ),
      Option(
        "برتقالى",
      ),
      Option(
        "وردى",
      ),
      Option(
        "أصفر",
      ),
      Option("أخضر", true),
      Option(
        "رمادى",
      ),
      Option(
        "أبيض",
      ),
      Option(
        "أزرق",
      ),
    ]);
    Question question3 = Question(color: Colors.blueAccent, title: 'وردى', options: [
      Option(
        "أحمر",
      ),
      Option(
        "وردى",
      ),
      Option(
        "برتقالى",
      ),
      Option(
        "أصفر",
      ),
      Option(
        "أسود",
      ),
      Option(
        "رمادى",
      ),
      Option("أزرق", true),
      Option(
        "أخضر",
      ),
      Option(
        "أبيض",
      )
    ]);
    Question question4 = Question(color: Colors.pink, title: 'أصفر', options: [
      Option(
        "أصفر",
      ),
      Option(
        "أحمر",
      ),
      Option(
        "أزرق",
      ),
      Option(
        "رمادى",
      ),
      Option(
        "أخضر",
      ),
      Option(
        "برتقالى",
      ),
      Option("وردى", true),
      Option(
        "أسود",
      ),
      Option(
        "أبيض",
      )
    ]);
    Question question5 = Question(color: Colors.black, title: 'رمادى', options: [
      Option(
        "أبيض",
      ),
      Option(
        "أحمر",
      ),
      Option(
        "برتقالى",
      ),
      Option("أسود", true),
      Option(
        "أخضر",
      ),
      Option(
        "أصفر",
      ),
      Option(
        "وردى",
      ),
      Option(
        "رمادى",
      ),
      Option(
        "أزرق",
      ),
    ]);
    Question question6 = Question(color: Colors.white, title: 'أسود', options: [
      Option(
        "أحمر",
      ),
      Option(
        "أزرق",
      ),
      Option(
        "أسود",
      ),
      Option(
        "رمادى",
      ),
      Option("أبيض", true),
      Option(
        "برتقالى",
      ),
      Option(
        "أخضر",
      ),
      Option(
        "أصفر",
      ),
      Option(
        "وردى",
      ),
    ]);
    Question question7 = Question(color: Colors.red[700], title: 'برتقالى', options: [
      Option("أحمر", true),
      Option(
        "أزرق",
      ),
      Option(
        "برتقالى",
      ),
      Option(
        "أخضر",
      ),
      Option(
        "أصفر",
      ),
      Option(
        "وردى",
      ),
      Option(
        "أسود",
      ),
      Option(
        "رمادى",
      ),
      Option(
        "أبيض",
      )
    ]);

    List<Question> _questions = [
      question1,
      question2,
      question3,
      question4,
      question5,
      question6,
      question7
    ];
    // ignore: non_constant_identifier_names
    List<Question> RandomQuestions = (_questions..shuffle()).toList();
    List<Widget> options = [];
    if (_currentQuestion < _questions.length)
      options = RandomQuestions[_currentQuestion].options
          // ignore: non_constant_identifier_names
          .map((Option) => GridChild(option: Option, onClick: _onOptionClicked))
          .toList();
//    _questions.shuffle();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Icon(
            Icons.videogame_asset,
            color: Colors.blueAccent,
          ),
        ),
        title: Text(
          'لعبة الألوان',
          style: TextStyle(color: Colors.greenAccent),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.color_lens,
              color: Colors.redAccent,
            ),
          )
        ],
        centerTitle: true,
      ),
      body: _currentQuestion < _questions.length
          ? Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Text(
                  'اختر لون الكلمة الأتية',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 2,
                ),
                QuestionText(
                  title: _questions[_currentQuestion].title,
                  color: _questions[_currentQuestion].color,
                ),
                SizedBox(
                  height: 15,
                ),
                Flexible(
                  child: GridView.count(
                      crossAxisCount: 3,
                      padding: EdgeInsets.all(5.0),
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      children: options),
                ),
                scores(
                    currentScore: _currentScore,
                    currentQuestion: _currentQuestion)
              ],
            )
          : GameOver(currentScore: _currentScore,
        questions: _questions,
        playAgain: playAgain),
    );
  }


}


