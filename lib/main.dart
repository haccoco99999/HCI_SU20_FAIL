import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterappbaby/countevent.dart';
import 'package:flutterappbaby/game.dart';

import 'game/quizler/quizler.dart';

var timechosen = 0;
var timeprint = '';
var gameallowed = 0;

var babyid_chosen, babyname_chosen, babyavatar_chosen;

var textEdit = TextEditingController();

class Baby {
  int id;
  String name;
  String urlAvatar;

  Baby(this.id, this.name, this.urlAvatar);
}

List<Baby> babies = <Baby>[
  Baby(1, 'Huy', 'assets/baby1.jpg'),
  Baby(2, 'Tam', 'assets/baby2.jpg'),
  Baby(3, 'Dinh', 'assets/baby3.jpg')
];

// initial value for edit page
TextEditingController myController = TextEditingController()
  ..text = babyname_chosen;

void main() => runApp(MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green, accentColor: Colors.yellowAccent),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => CauHoiKhiDangNhap())));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/dinh2x.png'),
            fit: BoxFit.cover,
          )),
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int baby_id;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        home: Scaffold(
            body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/dinh32x.png'), fit: BoxFit.cover)),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    height: 250.0,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 4),
                      child: Container(
                        color: Colors.white.withOpacity(0.2),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: <Widget>[
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    'Hãy Chọn Bé',
                                    style: TextStyle(
                                        fontSize: 32.0,
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.indigo,
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            Container(
                              height: 150.0,
                              /*child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 9,
                                  itemBuilder: (context, index) => Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/dinh32x.png'),
                                                fit: BoxFit.cover)),
                                        // color: Colors.red,
                                        width: 100.0,
                                        margin: EdgeInsets.only(right: 8.0),
                                      )),*/
                              /* child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage('assets/baby1.jpg'),
                                            fit: BoxFit.cover)),
                                    width: 215.0,
                                    margin: EdgeInsets.only(right: 8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TimeManage()),
                                        );
                                      },
                                    ),
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/baby2.jpg'),
                                              fit: BoxFit.cover)),
                                      width: 215.0,
                                      margin: EdgeInsets.only(right: 8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TimeManage()),
                                        );
                                      },
                                    ),),

                                  Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/baby3.jpg'),
                                              fit: BoxFit.cover)),
                                      width: 215.0,
                                      margin: EdgeInsets.only(right: 8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TimeManage()),
                                        );
                                      },
                                    ),)
                                ],
                              ),*/
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: babies.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    babies[index].urlAvatar),
                                                fit: BoxFit.cover)),
                                        width: 215.0,
                                        margin: EdgeInsets.only(right: 8.0),
                                        child: InkWell(
                                          onTap: () {
                                            babyid_chosen = babies[index].id;
                                            babyname_chosen =
                                                babies[index].name;
                                            babyavatar_chosen =
                                                babies[index].urlAvatar;
                                            textEdit.text = babies[index].name;
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TimeManage(index: index)),
                                            );
                                          },
                                        ));
                                  }),
                            )
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 70,
                  //color: Colors.white.withOpacity(0.2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      //SizedBox(width: 145,),
                      MaterialButton(
                        color: Colors.indigo,
                        onPressed: () {
                          //NewBaby
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewBaby()),
                          );
                        },
                        child: Text(
                          'Thêm Bé',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MaterialButton(
                        color: Colors.indigo,
                        onPressed: () {},
                        child: Text(
                          'Sửa Hồ Sơ',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )));
  }
}

class TimeManage extends StatefulWidget {
  int index;

  TimeManage({this.index});

  @override
  _TimeManageState createState() => _TimeManageState(index);
}

class _TimeManageState extends State<TimeManage>
    with SingleTickerProviderStateMixin {
  int index;

  _TimeManageState(this.index);

  AnimationController animationController;
  Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  Animation rotationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        //MaterialApp(
        Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/dinh2x.png'), fit: BoxFit.cover)),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomRight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                    width: 300.0,
                    height: 150.0,
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 4),
                        child: Container(
                          color: Colors.white.withOpacity(0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 115,
                                      child: RaisedButton(
                                        color: Colors.cyan,
                                        onPressed: () {
                                          setState(() {
                                            //timeprint = '2 giờ';
                                            timechosen = 30;
                                            timeprint = ' 30 phút';
                                            gameallowed = 2;
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      GameManage()),
                                            );
                                          });
                                        },
                                        child: Text(
                                          '30 phút',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 115,
                                      child: RaisedButton(
                                        onPressed: () {
                                          setState(() {
                                            //   timeprint = '2 giờ';
                                            timechosen = 60;
                                            timeprint = ' 1 giờ';
                                            gameallowed = 4;
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      GameManage()),
                                            );
                                          });
                                        },
                                        child: Text(
                                          '1 giờ',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: Colors.cyan,
                                        /*shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      side: BorderSide(color: Colors.black),
                                    ),*/
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 115,
                                      child: RaisedButton(
                                        onPressed: () {
                                          setState(() {
                                            // timeprint = '2 giờ';
                                            timechosen = 90;
                                            timeprint = '1 giờ 30 phút';
                                            gameallowed = 6;
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      GameManage()),
                                            );
                                          });
                                        },
                                        child: Text(
                                          '1 giờ 30 phút',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: Colors.cyan,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 115,
                                      child: RaisedButton(
                                        onPressed: () {
                                          setState(() {
                                            //   timeprint = '2 giờ';
                                            timechosen = 120;
                                            timeprint = '2 giờ';
                                            gameallowed = 8;
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      GameManage()),
                                            );
                                          });
                                        },
                                        child: Text(
                                          '2 giờ',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: Colors.cyan,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ))
                    //color: Colors.white.withOpacity(0.2),
                    ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              /* bottom: 30,
              right: 100,*/
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  IgnorePointer(
                    child: Container(
                      color: Colors.white.withOpacity(0.0),
                      // comment or change to transparent color
                      height: 150.0,
                      width: 230.0,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFromDegree(270),
                        degOneTranslationAnimation.value * 100),
                    child: Transform(
                      transform: Matrix4.rotationZ(
                          getRadiansFromDegree(rotationAnimation.value))
                        ..scale(degOneTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: CircularButton(
                        color: Colors.blue,
                        width: 50,
                        height: 50,
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onClick: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFromDegree(225),
                        degTwoTranslationAnimation.value * 100),
                    child: Transform(
                      transform: Matrix4.rotationZ(
                          getRadiansFromDegree(rotationAnimation.value))
                        ..scale(degTwoTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: CircularButton(
                        color: Colors.black,
                        width: 50,
                        height: 50,
                        icon: Icon(
                          Icons.create,
                          color: Colors.white,
                        ),
                        onClick: () {
                          //Edit
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Edit(index: index)),
                          );
                        },
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFromDegree(180),
                        degThreeTranslationAnimation.value * 100),
                    child: Transform(
                      transform: Matrix4.rotationZ(
                          getRadiansFromDegree(rotationAnimation.value))
                        ..scale(degThreeTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: CircularButton(
                        color: Colors.orangeAccent,
                        width: 50,
                        height: 50,
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        onClick: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Stats()),
                          ); //Stats
                        },
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.rotationZ(
                        getRadiansFromDegree(rotationAnimation.value)),
                    alignment: Alignment.center,
                    child: CircularButton(
                      color: Colors.red,
                      width: 60,
                      height: 60,
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onClick: () {
                        if (animationController.isCompleted) {
                          animationController.reverse();
                        } else {
                          animationController.forward();
                        }
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),

      /*floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,*/
    )
        //)
        ;
  }
}

/*FloatingActionButton(
            child: Icon(Icons.arrow_back),
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            mini: true,
            onPressed: () => Navigator.of(context).pop(),
          )*/

class GameManage extends StatefulWidget {
  @override
  _GameManageState createState() => _GameManageState();
}

class _GameManageState extends State<GameManage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  Animation rotationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/dinh32x.png'),
                    fit: BoxFit.cover)),
            child: Stack(
              children: <Widget>[
                Align(
                    alignment: Alignment.topCenter,
                    child: ClipRRect(
                      child: Container(
                        width: 430.0,
                        height: 100.0,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 4),
                          child: Container(
                            color: Colors.white.withOpacity(0.2),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Bạn chọn $timeprint cho bé',
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.bold),
                                ),
                                Divider(
                                  color: Colors.indigo,
                                ),
                                Text(
                                  'Hãy Chọn $gameallowed Trò Chơi',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      child: Container(
                        height: 300.0,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 4),
                          child: Container(
                            color: Colors.white.withOpacity(0.2),
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.redAccent),
                                  child: Center(
                                    child: Text(
                                      'Lưu ý, hãy chọn trò chơi cho bé theo cặp. Ví dụ: 1 giáo dục - 1 giải trí.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                GameEdu(),
                                SizedBox(
                                  height: 10.0,
                                ),
                                GameEntertain(),
                                SizedBox(
                                  height: 10.0,
                                ),
                                StartGame()
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                Align(
                  alignment: Alignment.bottomRight,
                  /* bottom: 30,
              right: 100,*/
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      IgnorePointer(
                        child: Container(
                          color: Colors.white.withOpacity(0.0),
                          // comment or change to transparent color
                          height: 150.0,
                          width: 230.0,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(270),
                            degOneTranslationAnimation.value * 100),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation.value))
                            ..scale(degOneTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.blue,
                            width: 50,
                            height: 50,
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onClick: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(225),
                            degTwoTranslationAnimation.value * 100),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation.value))
                            ..scale(degTwoTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.black,
                            width: 50,
                            height: 50,
                            icon: Icon(
                              Icons.create,
                              color: Colors.white,
                            ),
                            onClick: () {
                              //Edit
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Edit()),
                              );
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(180),
                            degThreeTranslationAnimation.value * 100),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation.value))
                            ..scale(degThreeTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.orangeAccent,
                            width: 50,
                            height: 50,
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            onClick: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Stats()),
                              ); //Stats
                            },
                          ),
                        ),
                      ),
                      Transform(
                        transform: Matrix4.rotationZ(
                            getRadiansFromDegree(rotationAnimation.value)),
                        alignment: Alignment.center,
                        child: CircularButton(
                          color: Colors.red,
                          width: 60,
                          height: 60,
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onClick: () {
                            if (animationController.isCompleted) {
                              animationController.reverse();
                            } else {
                              animationController.forward();
                            }
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          /*floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,*/
        ));
  }
}

//floating button
class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onClick;

  CircularButton(
      {this.color, this.width, this.height, this.icon, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(icon: icon, enableFeedback: true, onPressed: onClick),
    );
  }
}

class Edit extends StatefulWidget {
  int index;

  Edit({this.index});

  @override
  _EditState createState() => _EditState(index);
}

class _EditState extends State<Edit> {
  int index;

  _EditState(this.index);

  @override
  Widget build(BuildContext context) {
    /*int index;
    _EditState(this.index);*/
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/dinh32x.png'), fit: BoxFit.cover)),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  child: Container(
                    height: 300.0,
                    width: 450.0,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 4),
                      child: Container(
                        color: Colors.white.withOpacity(0.2),
                        child: Column(
                          /*mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,*/
                          children: <Widget>[
                            SizedBox(
                              height: 50,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 100.0,
                                height: 100,
                                //color: Colors.black.withOpacity(0.2),  color: Colors.white.withOpacity(0.0),
                                child: Stack(
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 50,
                                      backgroundImage:
                                          // AssetImage(('assets/baby1.jpg')),
                                          AssetImage((babies[index].urlAvatar)),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        height: 30.0,
                                        width: 30.0,
                                        decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.create,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.indigo,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    // borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromARGB(143, 148, 251, 2),
                                          blurRadius: 20.0,
                                          offset: Offset(0, 10))
                                    ],
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[100]))),
                                child: TextField(
                                  controller: textEdit,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Nhập tên bé",
                                      hintStyle:
                                          TextStyle(color: Colors.black)),
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.indigo,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                //    width: 100.0,
                                height: 25,
                                color: Colors.white.withOpacity(0.0),
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 145.0,
                                    ),
                                    Center(
                                      child: FlatButton.icon(
                                        color: Colors.green,
                                        icon: Icon(Icons.save_alt),
                                        //`Icon` to display
                                        label: Text('Lưu'),
                                        //`Text` to display
                                        onPressed: () {
                                          //Code to execute when Floating Action Button is clicked
                                          //...
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Center(
                                      child: FlatButton.icon(
                                        color: Colors.red,
                                        icon: Icon(Icons.restore_from_trash),
                                        //`Icon` to display
                                        label: Text('Xóa'),
                                        //`Text` to display
                                        onPressed: () {
                                          //Code to execute when Floating Action Button is clicked
                                          //...
                                          //   babies.remove(babies[index]);
                                          /*Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => Edit()),
                                          )*/

                                          showAlertDeleteDialog(context, index);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )

                            //Align
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text('Quay lại'),
          icon: Icon(Icons.arrow_back),
          backgroundColor: Colors.redAccent,
          onPressed: () => Navigator.of(context).pop(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.black12),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100,
                // width: 150,
                //    decoration: BoxDecoration(color: Colors.red),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        width: 440,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Center(
                            child: Container(
                          width: 300,
                          /*decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),),*/
                          child: Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      AssetImage(('assets/baby1.jpg')),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "Bé Huy",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              //    )
                            ],
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                /*
                decoration: BoxDecoration(
                  color: Colors.red
                ),*/
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 25,
                      child: Center(
                          child: Text(
                        "19/07/2020",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                    ),
                    Expanded(
                      child: Container(
                        /*decoration: BoxDecoration(
                          color: Colors.cyan
                        ),*/
                        child: Center(
                          child: Text(
                            "Chủ Nhật",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 90,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                //  decoration: BoxDecoration(color: Colors.red),
                                child: Center(
                                  child: Container(
                                    height: 80,
                                    width: 110,
                                    /*decoration:
                                        BoxDecoration(color: Colors.blueAccent),*/
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: 50,
                                          child: Center(
                                              child:
                                                  /*Text(
                                                "Số Giờ Chơi",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              )*/
                                                  RichText(
                                            text: TextSpan(
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                                children: [
                                                  WidgetSpan(
                                                      child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 2.0),
                                                    child: Icon(Icons.history),
                                                  )),
                                                  TextSpan(
                                                      text: 'Số Giờ Chơi',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                      ))
                                                ]),
                                          )),
                                        ),
                                        Expanded(
                                          child: Container(
                                            /*decoration: BoxDecoration(
                          color: Colors.cyan
                        ),*/
                                            child: Center(
                                              child: Text(
                                                "3",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                //  decoration: BoxDecoration(color: Colors.red),
                                child: Center(
                                  child: Container(
                                    height: 80,
                                    width: 110,
                                    /*decoration:
                                        BoxDecoration(color: Colors.blueAccent),*/
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: 50,
                                          child: Center(
                                              child: RichText(
                                            text: TextSpan(
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                                children: [
                                                  WidgetSpan(
                                                      child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 2.0),
                                                    child: Icon(Icons.games),
                                                  )),
                                                  TextSpan(
                                                      text: 'Số Trò Chơi',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                      ))
                                                ]),
                                          )),
                                        ),
                                        Expanded(
                                          child: Container(
                                            /*decoration: BoxDecoration(
                          color: Colors.cyan
                        ),*/
                                            child: Center(
                                              child: Text(
                                                "10",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                //  decoration: BoxDecoration(color: Colors.red),
                                child: Center(
                                  child: Container(
                                    height: 80,
                                    width: 110,
                                    /*decoration:
                                        BoxDecoration(color: Colors.blueAccent),*/
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: 50,
                                          child: Center(
                                              child: RichText(
                                            text: TextSpan(
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                                children: [
                                                  WidgetSpan(
                                                      child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 2.0),
                                                    child: Icon(
                                                        Icons.check_circle),
                                                  )),
                                                  TextSpan(
                                                      text: 'Đánh Giá',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                      ))
                                                ]),
                                          )),
                                        ),
                                        Expanded(
                                          child: Container(
                                            /*decoration: BoxDecoration(
                          color: Colors.cyan
                        ),*/
                                            child: Center(
                                              child: Text(
                                                "4/5",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text('Quay lại'),
          icon: Icon(Icons.arrow_back),
          backgroundColor: Colors.redAccent,
          onPressed: () => Navigator.of(context).pop(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

class NewBaby extends StatefulWidget {
  @override
  _NewBabyState createState() => _NewBabyState();
}

class _NewBabyState extends State<NewBaby> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/dinh32x.png'), fit: BoxFit.cover)),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  child: Container(
                    height: 300.0,
                    width: 450.0,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 4),
                      child: Container(
                        color: Colors.white.withOpacity(0.2),
                        child: Column(
                          /*mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,*/
                          children: <Widget>[
                            SizedBox(
                              height: 50,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 100.0,
                                height: 100,
                                //color: Colors.black.withOpacity(0.2),  color: Colors.white.withOpacity(0.0),
                                child: Stack(
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 50,
                                      /*backgroundImage:
                                      AssetImage(('assets/baby1.jpg')), */
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        height: 30.0,
                                        width: 30.0,
                                        decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.create,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.indigo,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    // borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromARGB(143, 148, 251, 2),
                                          blurRadius: 20.0,
                                          offset: Offset(0, 10))
                                    ],
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[100]))),
                                child: TextField(
                                  // controller: myController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Nhập tên bé",
                                      hintStyle:
                                          TextStyle(color: Colors.black)),
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.indigo,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  //    width: 100.0,
                                  height: 25,
                                  color: Colors.white.withOpacity(0.0),
                                  child: Center(
                                    child: FlatButton.icon(
                                      color: Colors.green,
                                      icon: Icon(Icons.save_alt),
                                      //`Icon` to display
                                      label: Text('Lưu'),
                                      //`Text` to display
                                      onPressed: () {
                                        //Code to execute when Floating Action Button is clicked
                                        //...
                                      },
                                    ),
                                  )),
                            )

                            //Align
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text('Quay lại'),
          icon: Icon(Icons.arrow_back),
          backgroundColor: Colors.redAccent,
          onPressed: () => Navigator.of(context).pop(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

class ParentManage extends StatefulWidget {
  @override
  _ParentManageState createState() => _ParentManageState();
}

class _ParentManageState extends State<ParentManage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/dinh32x.png'),
            fit: BoxFit.cover,
          )),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 4),
            child: Container(
              color: Colors.white.withOpacity(0.2),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Text(
                      'Quản Lý Cho Ba Mẹ',
                      style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Align(
                                alignment: Alignment.centerLeft,
                                child: labelContainer('Danh Sách Bé')),
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                icon: Icon(Icons.add_circle_outline),
                                color: Colors.redAccent,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NewBaby()),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.redAccent),
                        child: Center(
                          child: Text(
                            'Hãy Chọn Bé Nhằm Tùy Chỉnh Giờ Chơi',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: babies.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              babies[index].urlAvatar),
                                          fit: BoxFit.cover)),
                                  width: 250.0,
                                  margin: EdgeInsets.only(right: 8.0),
                                  child: InkWell(
                                    onTap: () {
                                      babyid_chosen = babies[index].id;
                                      babyname_chosen = babies[index].name;
                                      babyavatar_chosen =
                                          babies[index].urlAvatar;
                                      textEdit.text = babies[index].name;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChildrenManage(
                                                  index: index,
                                                )),
                                        //TimeManage(index: index)),
                                      );
                                    },
                                  ));
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: labelContainer('Danh Sách Trò Chơi Hiện Có'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Align(
                                alignment: Alignment.centerLeft,
                                child: labelContainer('Trò Chơi Giáo Dục')),
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                  icon: Icon(Icons.settings),
                                  color: Colors.redAccent,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              QuanLyGameEdu()),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          height: 130,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: gamesEdu.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      // width: 100, height: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  gamesEdu[index].urlImage),
                                              fit: BoxFit.cover)),
                                      width: 80.0, height: 80,
                                      margin: EdgeInsets.only(right: 8.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ChiTietGame(
                                                  index: index,
                                                )),
                                            //TimeManage(index: index)),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      gamesEdu[index].title,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Align(
                                alignment: Alignment.centerLeft,
                                child: labelContainer('Trò Chơi Giải Trí')),
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                  icon: Icon(Icons.settings),
                                  color: Colors.redAccent, //QuanLyGameEnt
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              QuanLyGameEnt()),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          height: 130,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: gamesEntertain.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      // width: 100, height: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  gamesEntertain[index].urlImage),
                                              fit: BoxFit.cover)),
                                      width: 80.0, height: 80,
                                      margin: EdgeInsets.only(right: 8.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ChiTietGameEnt(
                                                  index: index,
                                                )),
                                            //TimeManage(index: index)),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      gamesEntertain[index].title,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(9.0),
                        child: labelContainer('Hoạt Động Của Bé Trong Ngày'),
                      ),
                      Container(
                        height: 25,
                        child: Center(
                            child: Text(
                          "19/07/2020",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "Chủ Nhật",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 240,
                        child: Row(
                          children: <Widget>[
                            // SizedBox(width: 10,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Container(
                                    child: Container(
                                      //height: 110,
                                      width: 110,
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Center(
                                              child: CircleAvatar(
                                                radius: 35,
                                                backgroundImage: AssetImage(
                                                    ('assets/baby1.jpg')),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              "Bé Huy",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            height: 100,
                                            width: 250,
                                            /*color:
                                                Colors.black.withOpacity(0.2),*/
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Column(
                                                          children: <Widget>[
                                                            SizedBox(
                                                              height: 10.0,
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topCenter,
                                                              child: Text(
                                                                'Số giờ chơi',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5.0,
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                '65 phút',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  VerticalDivider(
                                                    color: Colors.indigo,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: Column(
                                                          children: <Widget>[
                                                            SizedBox(
                                                              height: 10.0,
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topCenter,
                                                              child: Text(
                                                                'Số trò chơi',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5.0,
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                  '5 trò',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Container(
                                    child: Container(
                                      //    height: 110,
                                      width: 110,
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Center(
                                              child: CircleAvatar(
                                                radius: 35,
                                                backgroundImage: AssetImage(
                                                    ('assets/baby2.jpg')),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              "Bé Tâm",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            height: 100,
                                            width: 250,
                                            /*color:
                                              Colors.black.withOpacity(0.2),*/
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Column(
                                                          children: <Widget>[
                                                            SizedBox(
                                                              height: 10.0,
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topCenter,
                                                              child: Text(
                                                                'Số giờ chơi',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5.0,
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                '70 phút',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  VerticalDivider(
                                                    color: Colors.indigo,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: Column(
                                                          children: <Widget>[
                                                            SizedBox(
                                                              height: 10.0,
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topCenter,
                                                              child: Text(
                                                                'Số trò chơi',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5.0,
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                  '8 trò',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Container(
                                    child: Container(
                                      //  height: 110,
                                      width: 110,
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Center(
                                              child: CircleAvatar(
                                                radius: 35,
                                                backgroundImage: AssetImage(
                                                    ('assets/baby3.jpg')),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              "Bé Đinh",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            height: 100,
                                            width: 250,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Column(
                                                          children: <Widget>[
                                                            SizedBox(
                                                              height: 10.0,
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topCenter,
                                                              child: Text(
                                                                'Số giờ chơi',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5.0,
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                '0 phút',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  VerticalDivider(
                                                    color: Colors.indigo,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: Column(
                                                          children: <Widget>[
                                                            SizedBox(
                                                              height: 10.0,
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topCenter,
                                                              child: Text(
                                                                'Số trò chơi',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5.0,
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                  '0 trò',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
              /*        Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(9.0),
                            child: labelContainer('Các Tùy Chỉnh Khác'),
                          ),
                          Container(
                            height: 70,
                            //color: Colors.white.withOpacity(0.2),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                //SizedBox(width: 145,),
*//*                                MaterialButton(
                                  color: Colors.indigo,
                                  onPressed: () {
                                    //NewBaby
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NewBaby()),
                                    );
                                  },
                                  child: Text(
                                    'Sửa Mật Khẩu',
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                  ),
                                ),*//*
                                SizedBox(
                                  width: 5,
                                ),
                                MaterialButton(
                                  color: Colors.indigo,
                                  onPressed: () {Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SplashScreenQUiz()),
                                  );},
                                  child: Text(
                                    'Sửa Hồ Sơ',
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                  ),
                                ),*//*
                                SizedBox(
                                  width: 5,
                                ),
                                MaterialButton(
                                  color: Colors.indigo,
                                  onPressed: () {Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ExitScreen()),
                                  );},
                                  child: Text(
                                    'Thoát',
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                  ),
                                ),*//*
                              ],
                            ),
                          )
                        ],
                      )*/
                    ],
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
      ),
    );
  }
}

class ChildrenManage extends StatefulWidget {
  int index;

  ChildrenManage({this.index});

  @override
  _ChildrenManageState createState() => _ChildrenManageState(index);
}

class _ChildrenManageState extends State<ChildrenManage>
    with SingleTickerProviderStateMixin {
  int index;

  _ChildrenManageState(this.index);

  AnimationController animationController;
  Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  Animation rotationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  //int number  = this.index;
  //var namechild = babies[index].name;
  //static String name_child = ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/dinh32x.png'),
              fit: BoxFit.cover,
            )),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 4),
              child: Container(
                color: Colors.white.withOpacity(0.2),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 420,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white),
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 100.0,
                                  height: 100,
                                  //color: Colors.black.withOpacity(0.2),  color: Colors.white.withOpacity(0.0),
                                  child: Stack(
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundImage:
                                            // AssetImage(('assets/baby1.jpg')),
                                            AssetImage(
                                                (babies[index].urlAvatar)),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          height: 30.0,
                                          width: 30.0,
                                          decoration: BoxDecoration(
                                            color: Colors.redAccent,
                                            shape: BoxShape.circle,
                                          ),
                                          child: IconButton(
                                            icon: Icon(Icons.create),
                                            color: Colors.white,
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Edit(
                                                            index: index,
                                                          )));
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  babies[index].name,
                                  style: TextStyle(
                                      color: Colors.indigo, fontSize: 30),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.indigo,
                          ),
                          Container(
                            //color:Colors.black
                            height: 50,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Center(
                                        child: Text(
                                          'Số giờ chơi trong ngày',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                      Center(
                                        child: Text('65 phút',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18)),
                                      )
                                    ],
                                  ),
                                ),
                                VerticalDivider(color: Colors.indigo),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Center(
                                        child: Text(
                                          'Số ngày chơi trong tuần',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          '7 ngày',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                VerticalDivider(color: Colors.indigo),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Center(
                                        child: Text(
                                          'Số trò chơi',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          '10 trò',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Divider(color: Colors.indigo,),
                          Expanded(
                            child: Container(
                              color: Colors.indigo,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                        'Danh Sách Trò Chơi Đã Chơi', style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 150,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              gamesEdu[0].urlImage),
                                                          fit: BoxFit.cover)),
                                                  width: 80.0, height: 80,
                                                  margin: EdgeInsets.only(right: 8.0),

                                                ),
                                                SizedBox(height: 10.0,),
                                                Text(
                                                  gamesEdu[0].title,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              gamesEdu[2].urlImage),
                                                          fit: BoxFit.cover)),
                                                  width: 80.0, height: 80,
                                                  margin: EdgeInsets.only(right: 8.0),

                                                ),
                                                SizedBox(height: 10.0,),
                                                Text(
                                                  gamesEdu[2].title,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              gamesEdu[6].urlImage),
                                                          fit: BoxFit.cover)),
                                                  width: 80.0, height: 80,
                                                  margin: EdgeInsets.only(right: 8.0),

                                                ),
                                                SizedBox(height: 10.0,),
                                                Text(
                                                  gamesEdu[6].title,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              gamesEdu[5].urlImage),
                                                          fit: BoxFit.cover)),
                                                  width: 80.0, height: 80,
                                                  margin: EdgeInsets.only(right: 8.0),

                                                ),
                                                SizedBox(height: 10.0,),
                                                Text(
                                                  gamesEdu[5].title,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              gamesEdu[3].urlImage),
                                                          fit: BoxFit.cover)),
                                                  width: 80.0, height: 80,
                                                  margin: EdgeInsets.only(right: 8.0),

                                                ),
                                                SizedBox(height: 10.0,),
                                                Text(
                                                  gamesEdu[3].title,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              gamesEntertain[3].urlImage),
                                                          fit: BoxFit.cover)),
                                                  width: 80.0, height: 80,
                                                  margin: EdgeInsets.only(right: 8.0),

                                                ),
                                                SizedBox(height: 10.0,),
                                                Text(
                                                  gamesEntertain[3].title,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              gamesEntertain[1].urlImage),
                                                          fit: BoxFit.cover)),
                                                  width: 80.0, height: 80,
                                                  margin: EdgeInsets.only(right: 8.0),

                                                ),
                                                SizedBox(height: 10.0,),
                                                Text(
                                                  gamesEntertain[1].title,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              gamesEntertain[8].urlImage),
                                                          fit: BoxFit.cover)),
                                                  width: 80.0, height: 80,
                                                  margin: EdgeInsets.only(right: 8.0),

                                                ),
                                                SizedBox(height: 10.0,),
                                                Text(
                                                  gamesEntertain[8].title,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              gamesEntertain[7].urlImage),
                                                          fit: BoxFit.cover)),
                                                  width: 80.0, height: 80,
                                                  margin: EdgeInsets.only(right: 8.0),

                                                ),
                                                SizedBox(height: 10.0,),
                                                Text(
                                                  gamesEntertain[7].title,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              gamesEntertain[4].urlImage),
                                                          fit: BoxFit.cover)),
                                                  width: 80.0, height: 80,
                                                  margin: EdgeInsets.only(right: 8.0),

                                                ),
                                                SizedBox(height: 10.0,),
                                                Text(
                                                  gamesEntertain[4].title,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.redAccent),
                      child: Center(
                        child: Text(
                          'Tùy Chỉnh Giờ Chơi Cho Bé',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 135,
                            child: RaisedButton(
                              color: Colors.indigo,
                              onPressed: () {
                                setState(() {
                                  //timeprint = '2 giờ';
                                  timechosen = 30;
                                  timeprint = ' 30 phút';
                                  gameallowed = 2;
                                  /*        Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            GameManage()),
                                  );*/
                                });
                              },
                              child: Text(
                                '30 phút',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 115,
                            child: RaisedButton(
                              onPressed: () {
                                setState(() {
                                  //   timeprint = '2 giờ';
                                  timechosen = 60;
                                  timeprint = ' 1 giờ';
                                  gameallowed = 4;
                                  /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            GameManage()),
                                  );*/
                                });
                              },
                              child: Text(
                                '1 giờ',
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 115,
                            child: RaisedButton(
                              onPressed: () {
                                setState(() {
                                  // timeprint = '2 giờ';
                                  timechosen = 90;
                                  timeprint = '1 giờ 30 phút';
                                  gameallowed = 6;
                                  /*Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            GameManage()),
                                  );*/
                                });
                              },
                              child: Text(
                                '1 giờ 30 phút',
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 115,
                            child: RaisedButton(
                              onPressed: () {
                                setState(() {
                                  //   timeprint = '2 giờ';
                                  timechosen = 120;
                                  timeprint = '2 giờ';
                                  gameallowed = 8;
                                  /*Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            GameManage()),
                                  );*/
                                });
                              },
                              child: Text(
                                '2 giờ',
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Center(
                      child: Text(
                        'Bạn Chọn $timeprint Cho Bé',
                        style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.redAccent),
                      child: Center(
                        child: Text(
                          'Hãy Chọn $gameallowed Trò Chơi Cho Bé',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        'Lưu ý, hãy chọn trò chơi cho bé theo cặp. Ví dụ: 1 giáo dục - 1 giải trí.',
                        style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    GameEdu(),
                    SizedBox(
                      height: 10,
                    ),
                    GameEntertain(),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.redAccent),
                      child: Center(
                        child: Text(
                          'Nếu Đã Chọn Xong Hãy Bấm Bắt Đầu Cho Bé Chơi',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                    StartGame(),
                    //text floating button,
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: Align(
            alignment: Alignment.bottomRight,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                IgnorePointer(
                  child: Container(
                    color: Colors.white.withOpacity(0.0),
                    // comment or change to transparent color
                    height: 150.0,
                    width: 230.0,
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(225),
                      degOneTranslationAnimation.value * 100),
                  child: Transform(
                    transform: Matrix4.rotationZ(
                        getRadiansFromDegree(rotationAnimation.value))
                      ..scale(degOneTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      color: Colors.blue,
                      width: 50,
                      height: 50,
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onClick: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(180),
                      degTwoTranslationAnimation.value * 100),
                  child: Transform(
                    transform: Matrix4.rotationZ(
                        getRadiansFromDegree(rotationAnimation.value))
                      ..scale(degTwoTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      color: Colors.black,
                      width: 50,
                      height: 50,
                      icon: Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      ),
                      onClick: () {
                        //Edit
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ExitScreen()),
                        );
                      },
                    ),
                  ),
                ),
/*                Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(180),
                      degThreeTranslationAnimation.value * 100),
                  child: Transform(
                    transform: Matrix4.rotationZ(
                        getRadiansFromDegree(rotationAnimation.value))
                      ..scale(degThreeTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      color: Colors.orangeAccent,
                      width: 50,
                      height: 50,
                      icon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      onClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SuaHoSoPH()),
                        ); //Stats
                      },
                    ),
                  ),
                ),*/
                Transform(
                  transform: Matrix4.rotationZ(
                      getRadiansFromDegree(rotationAnimation.value)),
                  alignment: Alignment.center,
                  child: CircularButton(
                    color: Colors.red,
                    width: 60,
                    height: 60,
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onClick: () {
                      if (animationController.isCompleted) {
                        animationController.reverse();
                      } else {
                        animationController.forward();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class ExitScreen extends StatefulWidget {
  @override
  _ExitScreenState createState() => _ExitScreenState();
}

class _ExitScreenState extends State<ExitScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        home: Scaffold(
          body: Container(
              color: Colors.black,
              child: Center(
                  child: Container(
                      height: 200,
                      //color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Text(
                              'Hãy Trả Lời Đúng Câu Hỏi Để Thoát Ứng Dụng ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Center(
                            child: Text(
                                'Đảng Cộng Sản Việt Nam Thành Lập Vào Ngày Tháng Năm Nào ? ',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ), //SystemNavigator.pop()
                          Center(
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: RaisedButton(
                                    color: Colors.red,
                                    child: Text(
                                      '30/4/1975',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: RaisedButton(
                                    color: Colors.red,
                                    child: Text(
                                      '7/5/1954',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: RaisedButton(
                                    color: Colors.red,
                                    child: Text(
                                      '3/2/1932',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: RaisedButton(
                                    color: Colors.red,
                                    child: Text(
                                      'Tất Cả Đều Sai',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () => SystemNavigator.pop(),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )))),
          floatingActionButton: FloatingActionButton.extended(
            label: Text('Quay Lại'),
            icon: Icon(Icons.arrow_back),
            backgroundColor: Colors.redAccent,
            onPressed: () => Navigator.of(context).pop(),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ));
  }
}

class SuaHoSoPH extends StatefulWidget {
  @override
  _SuaHoSoPHState createState() => _SuaHoSoPHState();
}

class _SuaHoSoPHState extends State<SuaHoSoPH> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/dinh32x.png'),
                fit: BoxFit.cover,
                
              ),
              
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 4),
              child: Container(
                color: Colors.white.withOpacity(0.2),
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: 10.0,),
                    Text('Điện Thoại Sử Dụng: Android')
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            label: Text('Quay Lại'),
            icon: Icon(Icons.arrow_back),
            backgroundColor: Colors.redAccent,
            onPressed: () => Navigator.of(context).pop(),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ));
  }
}

class CauHoiKhiDangNhap extends StatefulWidget {
  @override
  _CauHoiKhiDangNhapState createState() => _CauHoiKhiDangNhapState();
}

class _CauHoiKhiDangNhapState extends State<CauHoiKhiDangNhap> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        home: Scaffold(
            body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/dinh32x.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  color: Colors.white.withOpacity(0.2),
                  width: double.maxFinite,
                  height: 150,
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Hãy Trả Lời Đúng Câu Hỏi Để Vào Ứng Dụng ',
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Center(
                        child: Text(
                            'Báo Điện Tử Nhiều Người Đọc Nhất Ở Việt Nam Là Báo Nào ? ',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ), //SystemNavigator.pop()
                      Center(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: RaisedButton(
                                color: Colors.indigo,
                                child: Text(
                                  'ThanhNien',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () => SystemNavigator.pop(),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: RaisedButton(
                                color: Colors.indigo,
                                child: Text(
                                  'Zing News',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () => SystemNavigator.pop(),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: RaisedButton(
                                color: Colors.indigo,
                                child: Text(
                                  'Tuổi Trẻ',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () => SystemNavigator.pop(),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: RaisedButton(
                                  color: Colors.indigo,
                                  child: Text(
                                    'VNExpress',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ParentManage()),
                                    );
                                  }),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
