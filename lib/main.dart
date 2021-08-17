import 'package:animations/animations.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:life_rules/favorite.dart';
import 'package:life_rules/home.dart';
import 'package:life_rules/setting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int currentTab = 1;
  PageController _pageController=PageController(initialPage: 0);
  final List<Widget> screens = [Favorite(), Home(), Setting()];
  Widget currentScreen = Home();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'The Life Rules',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(title: Text('The Life Rules')),
            bottomNavigationBar: CurvedNavigationBar(
              height: 50,
              backgroundColor: Colors.white,
              color: Colors.blueAccent,
              buttonBackgroundColor: Colors.blueAccent,
              items: <Widget>[
                Icon(
                  Icons.favorite_rounded,
                  size: 30,
                  color: Colors.red[400],
                ),
                Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ],
              index: currentTab,
              animationCurve: Curves.decelerate,
              animationDuration: Duration(milliseconds: 500),
              onTap: (index) {
                setState(() {
                  currentScreen=screens[index];
                  _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.linear);
                });
              },
            ),
            body: PageView(
              controller: _pageController,
              onPageChanged: (page){
                setState(() {
                  currentTab=page;
                });
              },
              children: [
                Favorite(),
                Home(),
                Setting(),
              ],
               ),
            ));
  }
}
