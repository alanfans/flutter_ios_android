import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ios_android/old/AlignWidget.dart';
import 'package:flutter_ios_android/old/JsonFile.dart';
import 'package:flutter_ios_android/old/MyButton.dart';
import 'package:flutter_ios_android/old/MyForm.dart';
import 'package:flutter_ios_android/old/MyHome.dart';

import 'package:flutter_ios_android/old/RowWidget.dart';
import 'package:flutter_ios_android/pages/camera.dart';

import 'firebase_auth/Auth.dart';
import 'old/FormDemo.dart';
import 'old/ListViewBuildWidget.dart';
import 'old/ListViewWidget.dart';

import 'old/MyPic.dart';
import 'old/StackWidget.dart';
import 'pages/login_signup_page.dart';
import 'pages/root_page.dart';

Future<void> main() async {
  // debugPaintSizeEnabled = true;
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        title: "黑客派",
//        home: Myapp1(),
        home: RootPage(
            auth: Auth()
        ),
      routes: <String, WidgetBuilder>{
        '/widget1': (BuildContext ctx) => CameraExampleHome(),
      },
    );
  }
}


class Myapp1 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _Myapp1();
}

class _Myapp1 extends State<Myapp1>{

  ScrollController _hideButtonController;

  var _currentIndex = 0;
  //创建页面控制器
  var _pageController;

  static var _isVisible = true;


  @override
  void initState() {
    super.initState();
    //页面控制器初始化
    _pageController = new PageController(initialPage : 0);
    _isVisible = true;
    _hideButtonController = new ScrollController();
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if(_isVisible)
          setState(() {
            _isVisible = false;
            print("**** $_isVisible up");
          });
      }
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if(!_isVisible)
          setState(() {
            _isVisible = true;
            print("**** $_isVisible down");
          });
      }
    });
  }

  Widget animatedContainer = AnimatedContainer(
      duration: Duration(milliseconds: 200),
    height: 60,
    child: _isVisible
        ? BottomNavigationBar(
        selectedFontSize: 14,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: [
          createItem(Icons.title, "1"),
          createItem(Icons.print, "2"),
          createItem(Icons.arrow_upward, "3"),
          createItem(Icons.people, "4"),
          createItem(Icons.code, "5"),
//            createItem(Icons.message, "6"),
//            createItem(Icons.email, "7"),
//            createItem(Icons.room, "8"),
//            createItem(Icons.room, "8"),
//            createItem(Icons.room, "8"),
        ],
      ) : Container(
      color: Colors.white,
    ),
  );


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      primary: true,
      appBar: PreferredSize(
        child: AppBar(
          title: Text("黑客派",style: TextStyle(fontSize: 10),),
        ),
        preferredSize: Size.fromHeight(10),
      ),
      body:  PageView(
//          index: _currentIndex,
      controller: _pageController,
        onPageChanged: (index){
          _currentIndex = index;
        },
          children: <Widget>[
            JsonFile(),
            ListViewWidget(),
              StackWidget(),
              AlignWidgete(),
              ListViewBuildWidget(),
//              PaddingWidget(),
//              ContainerWidget(),
//              BoxDecorationWidget(),
//            Center(
//              child: Container(
//                width: 200,
//                height: 200,
//                decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(20),
//                    image: DecorationImage(
//                      image: NetworkImage("https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg"),
//                    )
//                ),
//              ),
//            ),
            RowWidget()
          ],
        ),
//
        bottomNavigationBar: BottomNavigationBar(
          currentIndex:  _currentIndex,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          type: BottomNavigationBarType.fixed,
          items: [
            createItem(Icons.title, "1"),
            createItem(Icons.print, "2"),
            createItem(Icons.arrow_upward, "3"),
            createItem(Icons.people, "4"),
            createItem(Icons.code, "5"),
//            createItem(Icons.message, "6"),
//            createItem(Icons.email, "7"),
//            createItem(Icons.room, "8"),
//            createItem(Icons.room, "8"),
//            createItem(Icons.room, "8"),
          ],
          onTap: (index){
            setState(() {
              _currentIndex =  index;
            });
            //点击下面tabbar的时候执行动画跳转方法
            _pageController.animateToPage(index, duration: new Duration(milliseconds: 500),curve:new ElasticOutCurve(4));

          },
        ),

    );
  }

}


BottomNavigationBarItem createItem(IconData icons,String title){
  return BottomNavigationBarItem(
    icon: Icon(icons),
    activeIcon: Icon(icons),
    title: Text(title)
  );
}

class MyCountWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyCounterState();
  }
}

class MyCounterState extends State<MyCountWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: ListView(

          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FormDemo(),
            MyForm(),
            MyPic(),
            MyHome(),
            MyButton(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              RaisedButton(
                color: Colors.redAccent,
                child: Text("+1", style: TextStyle(fontSize: 18, color: Colors.white)),
                onPressed: () {
                    setState(() {
                      count ++;
                      print("onPressed: $count");
                    });
                },
              ),
                RaisedButton(
                  color: Colors.orangeAccent,
                  child: Text("-1", style: TextStyle(fontSize: 18, color: Colors.white)),
                  onPressed: () {
                    setState(() {
                      count --;
                      print("onPressed: $count");
                    });
                  },
                )
              ],
            ),
            Text("当前计数：$count", style: TextStyle(fontSize: 30),textAlign: TextAlign.center,)
          ],
        ),
      )
    );
  }
}