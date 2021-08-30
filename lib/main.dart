import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_life/ui/components/my_bottom_navigation.dart';
import 'package:the_life/view/favorite.dart';
import 'package:the_life/view/home.dart';
import 'package:the_life/view/setting.dart';
import 'controller/main_page_controller.dart';

void main() {
  runApp(GetMaterialApp(home: MainHome()));
}

class MainHome extends StatelessWidget {
  // const Home({Key? key}) : super(key: key);
  final _mainPageController = Get.put(MainPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavigation(),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: PageView(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          physics: BouncingScrollPhysics(),
          controller: _mainPageController.pageController,
          onPageChanged: (int index) {
            _mainPageController.setCurrentTab(index);
          },
          children: [
            Favorite(),
            Home(),
            Setting(),
          ],
        ),
      ),
    );
  }

  void navigatePage(index) {}
}


// class MyAppState extends State<MyApp> {



//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'The Life Rules',
//         theme: ThemeData(
//           accentColor: Colors.blueAccent,
//           dividerColor: Colors.transparent,
//         ),
//         home: );
//   }

//   void navigatePage(index) {
//     _pageController.animateToPage(index,
//         duration: Duration(milliseconds: 350), curve: Curves.ease);
//   }
// }
