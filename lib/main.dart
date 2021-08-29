import 'package:animations/animations.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_life/ui/components/my_bottom_navigation.dart';
import 'package:the_life/ui/pages/favorite.dart';
import 'package:the_life/ui/pages/home.dart';
import 'package:the_life/ui/pages/setting.dart';

import 'bloc/component_bloc/my_bottom_navigation.dart';
import 'bloc/data/rules_model.dart';

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
  PageController _pageController = PageController(initialPage: 1);
  final List<Widget> screens = [Favorite(), Home(), Setting()];
  Widget currentScreen = Home();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'The Life Rules',
        theme: ThemeData(
          accentColor: Colors.blueAccent,
          dividerColor: Colors.transparent,
        ),
        home: Scaffold(
          bottomNavigationBar: MyBottomNavigation(),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: PageView(
              clipBehavior: Clip.antiAlias,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  print('change${index}');
                  MyBottomNavigationBLoC.myBottomNavigationBloc.getIndexSink
                      .add(index);
                });
              },
              children: [
                Favorite(),
                Home(),
                Setting(),
              ],
            ),
          ),
        ));
  }
}
