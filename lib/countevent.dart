import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterappbaby/main.dart';

class TimeCountDown extends StatefulWidget {
  @override
  _TimeCountDownState createState() => _TimeCountDownState();
}

class _TimeCountDownState extends State<TimeCountDown> {
  Timer _timer;
  int _start = 0;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (timer) {
      if (_start < 1) {
        timer.cancel();
      } else {
        _start = _start - 1;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class EndGame extends StatefulWidget {
  @override
  _EndGameState createState() => _EndGameState();
}

class _EndGameState extends State<EndGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Container(
            width: 400, height: 250,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Icon(
                      Icons.check_circle_outline,
                      color: Colors.lightGreen,
                      size: 80,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text('Bé đã hoàn thành trò chơi.', style: TextStyle(
                      fontSize: 25, color: Colors.lightGreen, fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      ' Bấm vào đây để quay về',style: TextStyle(
                        fontSize: 20, color: Colors.lightGreen, fontWeight: FontWeight.bold
                    ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: RaisedButton(
                      color: Colors.indigo,
                      child: Text('Quay về Trang Chủ', style: TextStyle(
                        color: Colors.white, fontSize: 22
                      ),),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ParentManage()),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Thoát'),
        icon: Icon(Icons.exit_to_app),
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExitScreen()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
