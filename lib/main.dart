import 'package:flutter/material.dart';
import 'package:the_life/ui/components/my_bottom_navigation.dart';
import 'package:the_life/ui/pages/favorite.dart';
import 'package:the_life/ui/pages/home.dart';
import 'package:the_life/ui/pages/setting.dart';
import 'bloc/component_bloc/my_bottom_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  PageController _pageController =
      PageController(initialPage: 1, keepPage: true);
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
          bottomNavigationBar: MyBottomNavigation(navigatePage),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: PageView(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              physics: BouncingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
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

  void navigatePage(index) {
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 350), curve: Curves.ease);
  }
}
