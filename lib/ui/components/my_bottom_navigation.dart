import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_life/controller/main_page_controller.dart';

class MyBottomNavigation extends StatelessWidget {
  final MainPageController _mainPageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => CurvedNavigationBar(
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
            )
          ],
          index: _mainPageController.getCurrentTab(),
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            //   _mainPageController.pageController.animateToPage(index,
            //       duration: Duration(milliseconds: 350), curve: Curves.ease);
            //   // print(_mainPageController.getCurrentTab);
            //   print('click');
          },
          letIndexChange: (index) {
            _mainPageController.pageController.animateToPage(index,
                duration: Duration(milliseconds: 350), curve: Curves.ease);
            // print(_mainPageController.getCurrentTab);
            return false;
          },
        ));
  }
}
