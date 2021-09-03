import 'package:get/get.dart';
import 'package:rive/rive.dart';

class SettingController extends GetxController {
  var _isDarkMode = false.obs;
  setDarkModeStatus(status) {
    _isDarkMode.value = status;
  }

  bool get getDarkModeStatus => _isDarkMode.value;
}
