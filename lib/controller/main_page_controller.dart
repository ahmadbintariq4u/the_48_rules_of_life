import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {
  var currentTab = 1.obs;
  var pageController = PageController(initialPage: 1, keepPage: true);

  // For changing the navigation index
  setCurrentTab(index) {
    currentTab.value = index;
    print(currentTab.value);
  }

  int getCurrentTab() => currentTab.value;

  // for changing the page.
  navigateAccordingly() {
    pageController.animateToPage(currentTab.value,
        duration: Duration(milliseconds: 350), curve: Curves.ease);
  }
}
