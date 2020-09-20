import 'dart:ui';

import 'package:flutter/material.dart';

import 'game/quizler/quizler.dart';
import 'game/tictactoe/tictactoe.dart';
import 'main.dart';

//data
class Game {
  String id;
  String title, urlImage;
  Widget widget;
  int type; //0:giao duc 1:giai tri
  String des;
  String rate;

  Game(this.id, this.title, this.type, this.widget, this.urlImage, this.rate,
      this.des);
}

List<Game> listGameMoi = <Game>[
  Game(
      'GNEW01',
      'Trò Chơi Laser',
      0,
      Quizzler(),
      'assets/laser-gun.png',
      '4.9',
      'Đây là 1 game rất hay về solo'),
  Game(
      'GNEW02',
      'Ném Bowling ',
      0,
      Quizzler(),
      'assets/leisure.png',
      '4.6',
      'Đây là 1 game rất hay về chơi Bowling'),
  Game(
      'GNEW03',
      'Bắn Phi Thuyền',
      0,
      Quizzler(),
      'assets/spaceship.png',
      '4.2',
      'Đây là 1 game rất hay về bắn phi thuyền'),
  Game(
      'GNEW04',
      'Đua Xe Tốc Độ',
      0,
      Quizzler(),
      'assets/steering-wheel.png',
      '4.1',
      'Đây là 1 game rất hay về đua xe tốc độ'),
  Game(
      'GNEW05',
      'Phi Hành Gia',
      0,
      Quizzler(),
      'assets/vr-glasses-1.png',
      '3.7',
      'Đây là 1 game rất hay về du hành vũ trụ'),
  Game(
      'GNEW06',
      'Chỉnh Giờ',
      0,
      Quizzler(),
      'assets/vr-glasses-2.png',
      '4.8',
      'Chỉnh tối ưu giờ giấc'),
  Game(
      'GNEW07',
      'Mua Sắm',
      0,
      Quizzler(),
      'assets/vr-glasses-3.png',
      '4.4',
      'Sắp xếp cửa hàng tạo không gian cho khách hàng'),
];

List<Game> gamesEntertain = <Game>[
  Game(
      'GENT01',
      'TicTacToe',
      1,
      MyTicTacToe(),
      'assets/tictactoe.png',
      '4.1',
      'Đây là 1 game rất hay cho con nít vê TicTacToe'),
  Game(
      'GENT02',
      'Trái Tim Tưng Bừng',
      1,
      MyTicTacToe(),
      'assets/heart.png',
      '3.8',
      'Đây là 1 game thú vị về xếp trái tim cho hợp lý'),
  Game(
      'GENT03',
      'Bắt Pokemon',
      1,
      MyTicTacToe(),
      'assets/pokemon.png',
      '3.5',
      'Đây là game về bắt Pokemon'),
  Game(
      'GENT04',
      'Chiến Thuật',
      1,
      MyTicTacToe(),
      'assets/strategy.png',
      '4.0',
      'Đây là game chiến thuật cực kì thú vị'),
  Game(
      'GENT05',
      'Đối Tượng',
      1,
      MyTicTacToe(),
      'assets/target.png',
      '4.6',
      'Đây là game phóng phi tiêu đầy thú vị cho các bạn nhỏ'),
  Game(
      'GENT06',
      'Đua Cúp',
      1,
      MyTicTacToe(),
      'assets/trophy.png',
      '4.8',
      'Đây là game tranh đua cúp số 1 đầy thú vị cho các bé nhỏ'),
  Game(
      'GENT07',
      'Tháp Hà Nội',
      1,
      MyTicTacToe(),
      'assets/game.png',
      '4.9',
      'Game sắp xếp Tháp Hà Nội giải đố cực thú vị cho các bé thiếu nhi'),
  Game(
      'GENT08',
      'Ngựa Hoang',
      1,
      MyTicTacToe(),
      'assets/horseshoe.png',
      '4.1',
      'Game thuần chủng nuôi nhốt thú ngựa'),
  Game(
      'GENT09',
      'Đồng Xu',
      1,
      MyTicTacToe(),
      'assets/casio.png',
      '4.2',
      'Khám phá trải nghiệm tung đồng xu cực kì thú vị và khác thường'),
];

List<Game> gamesEdu = <Game>[
  Game(
      'GEDU01',
      'Đố Vui Tiếng Anh',
      0,
      Quizzler(),
      'assets/quiz.png',
      '4.5',
      'Đây là game giúp bé học tốt tiếng Anh hơn'),
  Game(
      'GEDU02',
      ' Đánh Bomb',
      0,
      Quizzler(),
      'assets/bomb.png',
      '4.7',
      'Đây là game đánh bomb giải cứu hoàng tử'),
  Game(
      'GEDU03',
      'Trò chơi Vui Tính',
      0,
      Quizzler(),
      'assets/dice.png',
      '4.1',
      '1 Game thú vị giải đố trí tuệ con người'),
  Game(
      'GEDU04',
      'Casino',
      0,
      Quizzler(),
      'assets/casino-chip.png',
      '4.2',
      'Khám phá cách giải đố hóc búa trong Casino'),
  Game(
      'GEDU05',
      'Jigsaw',
      0,
      Quizzler(),
      'assets/jigsaw.png',
      '3.5',
      '1 Game đầy thú vị về JigSaw'),
  Game(
      'GEDU06',
      'Mắt Kính Thần Kì',
      0,
      Quizzler(),
      'assets/vr-glasses.png',
      '4.3',
      'Khám Phá chiếc kính kì ảo trong thế giới khủng long'),
  Game(
      'GEDU07',
      'Bình Loạn',
      0,
      Quizzler(),
      'assets/sports-and-competition.png',
      '4.9',
      'Giải cứu thế giới diệt trừ kẻ gian ác'),
  Game(
      'GEDU08',
      'Siêu Nhân',
      0,
      Quizzler(),
      'assets/virtual-reality-glasses.png',
      '4.0',
      'Khám phá siêu nhân cứu thế giới khỏi thảm họa diệt vong'),
  Game(
      'GEDU09',
      'Xếp Gạch',
      0,
      Quizzler(),
      'assets/hobbies-and-free-time.png',
      '4.6',
      'Xếp gạch giúp bé giải đố'),
];

List<Game> listSelectedGame = List();
List<Widget> listWidgetGameStart = List();

bool isGameListSelectable() {
  if (listSelectedGame.length > 0) {
    if (listSelectedGame.length % 2 == 0) {
      return true;
    } else {
      return false;
    }
  }

  return false;
}

bool isNumberGameChecked() {
  int countEnt = 0,
      countEdu = 0;
  for (int i = 0; i < listSelectedGame.length; i++) {
    if (listSelectedGame[i].type == 0)
      countEnt += 1;
    else
      countEdu += 1;
  }
  if (countEnt != countEdu) return false;
  return true;
}

void orderGame() {
  listWidgetGameStart = List(listSelectedGame.length);
  int indexGameEdu = 0,
      indexGameEnt = 1;

  for (int i = 0; i < listSelectedGame.length; i++) {
    if (listSelectedGame[i].type == 0) {
      if (listWidgetGameStart[indexGameEdu] == null) {
        listWidgetGameStart[indexGameEdu] = listSelectedGame[i].widget;
        indexGameEdu += 2;
      }
    } else if (listSelectedGame[i].type == 1) {
      if (listWidgetGameStart[indexGameEnt] == null) {
        listWidgetGameStart[indexGameEnt] = listSelectedGame[i].widget;
        indexGameEnt += 2;
      }
    }
  }
}

//widget render
Widget labelContainer(String labelVal) {
  return Container(
    height: 24.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          labelVal,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.indigo),
        )
      ],
    ),
  );
}

class ImageShow extends StatefulWidget {
  String imageAsset;
  String appName;
  bool selectedBox;
  Game game;
  int index;

  ImageShow(
      {this.imageAsset, this.appName, this.selectedBox, this.game, this.index});

  @override
  _ImageShowState createState() => _ImageShowState();
}

class _ImageShowState extends State<ImageShow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 80.0,
            width: 80.0,
            decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage(widget.imageAsset),
                  //fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(20.0)),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            widget.appName,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 1.0,
          ),
          Checkbox(
            value: widget.selectedBox,
            onChanged: (value) {
              setState(() {
                widget.selectedBox = value;
                print(widget.selectedBox);
                print(widget.appName);
                if (widget.selectedBox) {
                  if (!listSelectedGame.contains(widget.game)) {
                    listSelectedGame.add(widget.game);
                    print(listSelectedGame.length);
                  }
                } else {
                  if (listSelectedGame.contains(widget.game)) {
                    listSelectedGame.remove(widget.game);
                    print(listSelectedGame.length);
                  }
                }
              });
            },
          )
        ],
      ),
    );
  }
}

//Game Edu

/*Widget GameEdu(){
  return Material(
    color: Colors.white,
    elevation: 14.0,
    shadowColor: Color(0x802196F3),
    child: Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.all(8.0),
            child: labelContainer('GAME GIÁO DỤC')),
        Padding(padding: EdgeInsets.all(8.0), child: gameEduContainer())
      ],
    ),
  );
}*/

Widget GameEdu() {
  /*return Material(
    color: Colors.white,
    elevation: 14.0,
    shadowColor: Color(0x802196F3),
    child: Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.all(8.0),
            child: labelContainer('GAME GIÁO DỤC')),
        Padding(padding: EdgeInsets.all(8.0), child: gameEduContainer())
      ],
    ),
  );*/
  return Column(
    children: <Widget>[
      Padding(
          padding: EdgeInsets.all(8.0), child: labelContainer('GAME GIÁO DỤC')),
      Padding(padding: EdgeInsets.all(8.0), child: gameEduContainer())
    ],
  );
}

Widget gameEduContainer() {
  return Container(
    height: 175.0,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: gamesEdu.length,
      itemBuilder: (BuildContext context, int index) {
        return ImageShow(
          imageAsset: gamesEdu[index].urlImage,
          appName: gamesEdu[index].title,
          selectedBox: false,
          game: gamesEdu[index],
          index: index,
        );
        // SizedBox(width: 20.0);
      },
      //children: <Widget>[],
    ),
  );
}

// Game Entertain
Widget GameEntertain() {
  return Column(
    //color: Colors.white,
    // elevation: 14.0,
    // shadowColor: Color(0x802196F3),
    // child: Column(
    children: <Widget>[
      Padding(
          padding: EdgeInsets.all(8.0),
          child: labelContainer('GAME GIẢI TRÍ ')),
      Padding(padding: EdgeInsets.all(8.0), child: gameEntertainContainer())
    ],
  );
}

Widget gameEntertainContainer() {
  return Container(
    height: 175.0,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: gamesEntertain.length,
      itemBuilder: (BuildContext context, int index) {
        return ImageShow(
          imageAsset: gamesEntertain[index].urlImage,
          appName: gamesEntertain[index].title,
          selectedBox: false,
          game: gamesEntertain[index],
          index: index,
        );
        // SizedBox(width: 20.0);
      },
      //children: <Widget>[],
    ),
  );
}

class StartGame extends StatefulWidget {
  @override
  _StartGameState createState() => _StartGameState();
}

class _StartGameState extends State<StartGame> with TickerProviderStateMixin {
  AnimationController _animationController;

  double _containerPaddingLeft = 20.0;
  double _animationValue;
  double _translateX = 0;
  double _translateY = 0;
  double _rotate = 0;
  double _scale = 1;

  bool show;
  bool sent = false;
  Color _color = Colors.red;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));
    show = true;

    _animationController.addListener(() {
      setState(() {
        show = false;
        _animationValue = _animationController.value;
        if (_animationValue >= 0.2 && _animationValue < 0.4) {
          _containerPaddingLeft = 100.0;
          _color = Colors.green;
        } else if (_animationValue >= 0.4 && _animationValue <= 0.5) {
          _translateX = 80.0;
          _rotate = -20.0;
          _scale = 0.1;
        } else if (_animationValue >= 0.5 && _animationValue <= 0.8) {
          _translateY = -20.0;
        } else if (_animationValue >= 0.81) {
          _containerPaddingLeft = 20.0;
          sent = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Center(
        child: GestureDetector(
          onTap: () {
            print(listSelectedGame.length);
            if (isGameListSelectable()) {
              if (isNumberGameChecked()) {
                orderGame();
                _animationController
                    .forward()
                    .whenComplete(() =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SplashScreenQUiz()),
                    ));

                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => listWidgetGameStart[1]),
                );*/
              } else
                showAlertDialog(context);
            } else {
              showAlertDialog(context);
            }
          },
          child: AnimatedContainer(
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(100.0),
                boxShadow: [
                  BoxShadow(
                    color: _color,
                    blurRadius: 21,
                    spreadRadius: -15,
                    offset: Offset(
                      0.0,
                      20.0,
                    ),
                  )
                ],
              ),
              padding: EdgeInsets.only(
                  left: _containerPaddingLeft,
                  right: 20.0,
                  top: 10.0,
                  bottom: 10.0),
              duration: Duration(milliseconds: 400),
              curve: Curves.easeOutCubic,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  (!sent)
                      ? AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    child: Icon(Icons.play_circle_filled),
                    curve: Curves.fastOutSlowIn,
                    transform: Matrix4.translationValues(
                        _translateX, _translateY, 0)
                      ..rotateZ(_rotate)
                      ..scale(_scale),
                  )
                      : Container(),
                  AnimatedSize(
                    vsync: this,
                    duration: Duration(milliseconds: 600),
                    child: show ? SizedBox(width: 10.0) : Container(),
                  ),
                  AnimatedSize(
                    vsync: this,
                    duration: Duration(milliseconds: 200),
                    child: show ? Text("Bắt Đầu") : Container(),
                  ),
                  AnimatedSize(
                    vsync: this,
                    duration: Duration(milliseconds: 200),
                    child: sent ? Icon(Icons.done) : Container(),
                  ),
                  AnimatedSize(
                    vsync: this,
                    alignment: Alignment.topLeft,
                    duration: Duration(milliseconds: 600),
                    child: sent ? SizedBox(width: 10.0) : Container(),
                  ),
                  AnimatedSize(
                    vsync: this,
                    duration: Duration(milliseconds: 200),
                    child: sent ? Text("Chơi Thôi") : Container(),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  Widget cancelButton = FlatButton(
    child: Text('ĐÓNG'),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop(GameManage());
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text('CÓ SAI SÓT'),
    content: Text('Bạn đã chọn chưa đủ hoặc sai cặp'),
    actions: <Widget>[cancelButton],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}

showAlertDeleteDialog(BuildContext context, index) {
  Widget cancelButton = FlatButton(
    child: Text('ĐÓNG'),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );
  Widget deleteButton = FlatButton(
    child: Text('ĐỒNG Ý'),
    onPressed: () {
      babies.removeAt(index);
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ParentManage()),
      );
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text('XÓA HỒ SƠ'),
    content: Text('Bạn có chắc chắn muốn xóa?'),
    actions: <Widget>[deleteButton, cancelButton],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}

showAlertDeleteGame(BuildContext context, page) {
  Widget cancelButton = FlatButton(
    child: Text('ĐÓNG'),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );
  Widget deleteButton = FlatButton(
    child: Text('ĐỒNG Ý'),
    onPressed: () {
      if (page == 'Edu') {
        if (listGameDelEdu.length == 0) {
          Navigator.of(context, rootNavigator: true).pop();
        } else {
          deleteGameDelEdu();
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ParentManage()),
          );
        }
      } else {
        if (listGameDelEnt.length == 0) {
          Navigator.of(context, rootNavigator: true).pop();
        } else {
          deleteGameEnt();
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ParentManage()),
          );
        }
      }
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text('XÓA TRÒ CHƠI'),
    content: Text('Bạn có chắc chắn muốn xóa?'),
    actions: <Widget>[deleteButton, cancelButton],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}

List<String> listGameDelEdu = List();
List<String> listGameDelEnt = List();

void deleteGameDelEdu() {
  if (listGameDelEdu.length > 0) {
    for (int i = 0; i < listGameDelEdu.length; i++) {
      for (int j = 0; j < gamesEdu.length; j++) {
        if (gamesEdu[j].id == listGameDelEdu[i]) gamesEdu.removeAt(j);
      }
    }
  }
}

void deleteGameEnt() {
  if (listGameDelEnt.length > 0) {
    for (int i = 0; i < listGameDelEnt.length; i++) {
      for (int j = 0; j < gamesEntertain.length; j++) {
        if (gamesEntertain[j].id == listGameDelEnt[i])
          gamesEntertain.removeAt(j);
      }
    }
  }
}

class QuanLyGameEdu extends StatefulWidget {
  @override
  _QuanLyGameEduState createState() => _QuanLyGameEduState();
}

class _QuanLyGameEduState extends State<QuanLyGameEdu> {
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
                )),
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    width: double.maxFinite,
                    height: 270,
                    color: Colors.white.withOpacity(0.2),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Text(
                            'Quản Lý Trò Chơi Giáo Dục Cho Bé',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Divider(color: Colors.indigo),
                        Expanded(
                          child: Container(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: gamesEdu.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ImageShowForEduGame(
                                  index: index,
                                  valueCheck: false,
                                );
                              },
                            ),
                          ),
                        ),
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Center(
                                child: FlatButton.icon(
                                  color: Colors.green,
                                  icon: Icon(Icons.add_box),
                                  //`Icon` to display
                                  label: Text('Thêm'),
                                  //`Text` to display
                                  onPressed: () {
                                    //Code to execute when Floating Action Button is clicked
                                    //...
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ThemGameMoi()));
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
                                    showAlertDeleteGame(context, 'Edu');
                                  },
                                ),
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

class QuanLyGameEnt extends StatefulWidget {
  @override
  _QuanLyGameEntState createState() => _QuanLyGameEntState();
}

class _QuanLyGameEntState extends State<QuanLyGameEnt> {
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
                )),
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    width: double.maxFinite,
                    height: 270,
                    color: Colors.white.withOpacity(0.2),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Text(
                            'Quản Lý Trò Chơi Giải Trí Cho Bé',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Divider(color: Colors.indigo),
                        Expanded(
                          child: Container(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: gamesEntertain.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ImageShowFotGameManage(
                                  index: index,
                                  valueCheck: false,
                                );
                              },
                            ),
                          ),
                        ),
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
/*                              SizedBox(
                                width: 270.0,
                              ),*/
                              Center(
                                child: FlatButton.icon(
                                  color: Colors.green,
                                  icon: Icon(Icons.add_box),
                                  //`Icon` to display
                                  label: Text('Thêm'),
                                  //`Text` to display
                                  onPressed: () {
                                    //Code to execute when Floating Action Button is clicked
                                    //...
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ThemGameMoi()));
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
                                    showAlertDeleteGame(context, 'Ent');
                                  },
                                ),
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

//chi tiet game edu
class ChiTietGame extends StatefulWidget {
  int index;

  ChiTietGame({this.index});

  @override
  _ChiTietGameState createState() => _ChiTietGameState();
}

class _ChiTietGameState extends State<ChiTietGame> {
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
                  Row(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          (gamesEdu[widget.index].urlImage)),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Text(
                                  gamesEdu[widget.index].title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35),
                                ),
                              ),
                              Text(
                                'Phù hợp cho trẻ từ 3 tuổi trở lên',
                                style: TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 220.0,
                          ),
                          Container(
                            //width: double.maxFinite,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: RichText(
                                  text: TextSpan(
                                    // style: TextStyle(fontSize: 15, color: Colors.indigo),
                                      children: [
                                        TextSpan(
                                            text: gamesEdu[widget.index].rate,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.indigo)),
                                        WidgetSpan(
                                            child: Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 2.0),
                                              child: Icon(Icons.star),
                                            )),
                                      ])),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Về Trò Chơi Này',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    color: Colors.indigo,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      gamesEdu[widget.index].des,
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.indigo)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Đánh Đố',
                              style:
                              TextStyle(color: Colors.indigo, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.indigo)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Trẻ em',
                              style:
                              TextStyle(color: Colors.indigo, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.indigo)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Thử Thách',
                              style:
                              TextStyle(color: Colors.indigo, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
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
      ),
    );
  }
}

class ChiTietGameEnt extends StatefulWidget {
  int index;

  ChiTietGameEnt({this.index});

  @override
  _ChiTietGameEntState createState() => _ChiTietGameEntState();
}

class _ChiTietGameEntState extends State<ChiTietGameEnt> {
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
                  Row(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          (gamesEntertain[widget.index]
                                              .urlImage)),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Text(
                                  gamesEntertain[widget.index].title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35),
                                ),
                              ),
                              Text(
                                'Phù hợp cho trẻ từ 3 tuổi trở lên',
                                style: TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 220.0,
                          ),
                          Container(
                            //width: double.maxFinite,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: RichText(
                                  text: TextSpan(
                                    // style: TextStyle(fontSize: 15, color: Colors.indigo),
                                      children: [
                                        TextSpan(
                                            text: gamesEntertain[widget.index]
                                                .rate,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.indigo)),
                                        WidgetSpan(
                                            child: Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 2.0),
                                              child: Icon(Icons.star),
                                            )),
                                      ])),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Về Trò Chơi Này',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    color: Colors.indigo,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      gamesEntertain[widget.index].des,
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.indigo)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Vui vẻ',
                              style:
                              TextStyle(color: Colors.indigo, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.indigo)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Trẻ em',
                              style:
                              TextStyle(color: Colors.indigo, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.indigo)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Giải Trí',
                              style:
                              TextStyle(color: Colors.indigo, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
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
      ),
    );
  }
}

class ImageShowFotGameManage extends StatefulWidget {
  int index;
  bool valueCheck;

  ImageShowFotGameManage({this.index, this.valueCheck});

  @override
  _ImageShowFotGameManageState createState() => _ImageShowFotGameManageState();
}

class _ImageShowFotGameManageState extends State<ImageShowFotGameManage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            // width: 100, height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(gamesEntertain[widget.index].urlImage),
                    fit: BoxFit.cover)),
            width: 80.0,
            height: 80,
            margin: EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ChiTietGameEnt(
                            index: widget.index,
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
            gamesEntertain[widget.index].title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          Checkbox(
            value: widget.valueCheck,
            onChanged: (value) {
              setState(() {
                widget.valueCheck = value;
                print(value);
                if (widget.valueCheck) {
                  if (!listGameDelEnt.contains(gamesEntertain[widget.index].id))
                    listGameDelEnt.add(gamesEntertain[widget.index].id);
                } else {
                  if (listGameDelEnt
                      .contains(gamesEntertain[widget.index].id)) {
                    listGameDelEnt.remove(gamesEntertain[widget.index].id);
                  }
                }
              });
            },
          )
        ],
      ),
    );
  }
}

class ImageShowForEduGame extends StatefulWidget {
  int index;
  bool valueCheck;

  ImageShowForEduGame({this.index, this.valueCheck});

  @override
  _ImageShowForEduGameState createState() => _ImageShowForEduGameState();
}

class _ImageShowForEduGameState extends State<ImageShowForEduGame> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            // width: 100, height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(gamesEdu[widget.index].urlImage),
                    fit: BoxFit.cover)),
            width: 80.0,
            height: 80,
            margin: EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ChiTietGame(
                            index: widget.index,
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
            gamesEdu[widget.index].title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          Checkbox(
            value: widget.valueCheck,
            onChanged: (value) {
              setState(() {
                widget.valueCheck = value;
                print(value);
                if (widget.valueCheck) {
                  if (!listGameDelEdu.contains(gamesEdu[widget.index].id))
                    listGameDelEdu.add(gamesEdu[widget.index].id);
                } else {
                  if (listGameDelEdu.contains(gamesEdu[widget.index].id)) {
                    listGameDelEdu.remove(gamesEdu[widget.index].id);
                  }
                }
              });
            },
          )
        ],
      ),
    );
  }
}


class ThemGameMoi extends StatefulWidget {
  @override
  _ThemGameMoiState createState() => _ThemGameMoiState();
}

class _ThemGameMoiState extends State<ThemGameMoi> {
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
              )),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 4),
            child: Container(
              color: Colors.white.withOpacity(0.2),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        'Danh Sách Game Mới',
                        style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.maxFinite, height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listGameMoi.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ChiTietTHemGame(
                              index: index, valueCheck: false,);
                          }),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 50, width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0)

                      ),

                      child: Text('Hãy chọn game để thêm mới',style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20, color: Colors.indigo
                      ),),
                    ),

                  ),
                  Center(
                    child: FlatButton.icon(
                      color: Colors.green,
                      icon: Icon(Icons.add_box),
                      //`Icon` to display
                      label: Text('Thêm'),
                      //`Text` to display
                      onPressed: () {
                        //Code to execute when Floating Action Button is clicked
                        //...
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ParentManage()));
                      },
                    ),
                  ),
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
      ),
    );
  }
}

class ChiTietTHemGame extends StatefulWidget {
  bool valueCheck;
  int index;

  ChiTietTHemGame({this.index, this.valueCheck});

  @override
  _ChiTietTHemGameState createState() => _ChiTietTHemGameState();
}

class _ChiTietTHemGameState extends State<ChiTietTHemGame> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(listGameMoi[widget.index].urlImage),
                    fit: BoxFit.cover)),
            width: 80.0,
            height: 80,
            margin: EdgeInsets.only(right: 8.0),
            child: InkWell(
              //ClickChuotBkChiTietGame
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ClickChuotBkChiTietGame(
                            index: widget.index,
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
            listGameMoi[widget.index].title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10,),
          Checkbox(
            value: widget.valueCheck,
            onChanged: (value) {
              setState(() {
                widget.valueCheck = value;

              });
            },
          )
        ],
      ),
    );
  }
}087


class ClickChuotBkChiTietGame extends StatefulWidget {

  int index;

  ClickChuotBkChiTietGame({this.index});

  @override
  _ClickChuotBkChiTietGameState createState() =>
      _ClickChuotBkChiTietGameState();
}

class _ClickChuotBkChiTietGameState extends State<ClickChuotBkChiTietGame> {
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
                  Row(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          (listGameMoi[widget.index]
                                              .urlImage)),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Text(
                                  listGameMoi[widget.index].title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35),
                                ),
                              ),
                              Text(
                                'Phù hợp cho trẻ từ 3 tuổi trở lên',
                                style: TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 220.0,
                          ),
                          Container(
                            //width: double.maxFinite,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: RichText(
                                  text: TextSpan(
                                    // style: TextStyle(fontSize: 15, color: Colors.indigo),
                                      children: [
                                        TextSpan(
                                            text: listGameMoi[widget.index]
                                                .rate,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.indigo)),
                                        WidgetSpan(
                                            child: Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 2.0),
                                              child: Icon(Icons.star),
                                            )),
                                      ])),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Về Trò Chơi Này',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    color: Colors.indigo,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      listGameMoi[widget.index].des,
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.indigo)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Vui vẻ',
                              style:
                              TextStyle(color: Colors.indigo, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.indigo)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Trẻ em',
                              style:
                              TextStyle(color: Colors.indigo, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.indigo)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Giải Trí',
                              style:
                              TextStyle(color: Colors.indigo, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
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
      ),
    );
  }
}
