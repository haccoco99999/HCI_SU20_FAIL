import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterappbaby/countevent.dart';

QuizBrain quizBrain = QuizBrain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}


class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              onPressed: () {
                bool result = quizBrain.getCorrectAnswer();
                setState(() {
//                  scoreKeeper.add(
//                    Icon(
//                      Icons.check,
//                      color: Colors.green,
//                    ),
//                  );
                  quizBrain.nextQuestion();
                  if(quizBrain.checkCoiXongChua()){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EndGame()),
                    );
                  }
                });
                print(result == true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool result = quizBrain.getCorrectAnswer();

                setState(() {
//                  scoreKeeper.add(
//                    Icon(
//                      Icons.close,
//                      color: Colors.red,
//                    ),
//                  );
                  quizBrain.nextQuestion();

                  if(quizBrain.checkCoiXongChua()){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EndGame()),
                    );
                  }
                });
                print(result == false);
              },
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: scoreKeeper,
          ),
        ),
      ],
    );
  }
}
int _questionNumber = 0;

class QuizBrain{


  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  void nextQuestion(){
    if(_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText(){
    return _questionBank[_questionNumber].question;
  }

  bool getCorrectAnswer(){
    return _questionBank[_questionNumber].answer;
  }

  bool checkCoiXongChua(){
    if(_questionNumber == (_questionBank.length -1 ))
      return true;
    return false;
  }
}




class Question{

  String question;
  bool answer;

  Question(String q, bool a) {
    question = q;
    answer = a;
  }
}

class SplashScreenQUiz extends StatefulWidget {
  @override
  _SplashScreenQUizState createState() => _SplashScreenQUizState();
}

class _SplashScreenQUizState extends State<SplashScreenQUiz> {

  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Quizzler())));
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.black,
          child: Center(
            child: Container(
              width: 200, height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/jigsaw.png'),
fit: BoxFit.cover
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}

