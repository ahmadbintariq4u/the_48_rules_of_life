import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:the_life/bloc/component_bloc/my_bottom_navigation.dart';

class MyBottomNavigation extends StatefulWidget {
  // MyBottomNavigation({Key? key}) : super(key: key);

  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  @override
  void initState() {
    // navigationBloc.getIndexSink.add(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        initialData: 1,
        stream: MyBottomNavigationBLoC.myBottomNavigationBloc.getIndexStream,
        builder: (context, snapshot) {
          return CurvedNavigationBar(
            height: 50,
            backgroundColor: Colors.transparent,
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
            index: snapshot.data ?? 0,
            animationCurve: Curves.decelerate,
            animationDuration: Duration(milliseconds: 500),
            onTap: (index) {
              print(snapshot.data);
              // setState(() {
              //   currentScreen = screens[index];
              //   // _pageController.jumpToPage(index);
              //   _pageController.animateToPage(index,
              //       duration: Duration(milliseconds: 300),
              //       curve: Curves.linear);
              // });
            },
          );
        });
  }
}
