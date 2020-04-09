import 'package:flutter/material.dart';

import 'FadeExmp.dart';
import 'SignatureTest.dart';
import 'StateA.dart';
import 'StateManage.dart';

void main() {
//  runApp(MyApp());
//  runApp(StateApp());
//  runApp(FadeAppTest());
  runApp(new MaterialApp(
    title: 'SIGNATURE DEMO',
    home: new SignatureApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //STEP 1 实现标题行
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  'Oeschinen Lake Campground',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Text(
                'Kandersteg, Switzerland',
                style: new TextStyle(color: Colors.grey[500]),
              )
            ],
          )),
          new FavoriteWidget()
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, color: color),
          new Container(
            margin: EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                  fontSize: 12.0, fontWeight: FontWeight.w500, color: color),
            ),
          )
        ],
      );
    }

    //STEP 2 实现按钮部分
    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE')
        ],
      ),
    );
    //STEP 3 实现文本部分
    Widget textSection = new Container(
      padding: EdgeInsets.all(32.0),
      child: new Text(
        '''
        Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    //STEP 4 实现图片部分
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('FIRST FLUTTER'),
            centerTitle: true,
          ),
          body: new ListView(
            children: [
              new Image.asset(
                'images/lake.jpeg',
                height: 240.0,
                fit: BoxFit.cover,
              ),
              titleSection,
              buttonSection,
              textSection
            ],
          )),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => new _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  var _favoriteCount = 40;

  @override
  Widget build(BuildContext context) {
    return new Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
      new Container(
        padding: EdgeInsets.all(0.0),
        child: new IconButton(
            icon: _isFavorited
                ? new Icon(Icons.star)
                : new Icon(Icons.star_border),
            color: Colors.red[500],
            onPressed: _toggleFavorite),
      ),
      new SizedBox(
        width: 18.0,
        child: new Text('$_favoriteCount'),
      )
    ]);
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited)
        _favoriteCount -= 1;
      else
        _favoriteCount += 1;
      _isFavorited = !_isFavorited;
    });
  }
}

class StateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "STATE MANAGE",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("STATE MANAGE"),
        ),
        body: new Center(
//          child: new TapboxA(),
//        child: new ParentWidget(),
            child: new Counter()),
      ),
    );
  }
}

/***
 * TapboxA 这个例子 widget管理自己的state
 */
class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? "active" : "inactive",
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}
