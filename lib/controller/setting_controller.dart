import 'package:get/get.dart';

class SettingController extends GetxController {
  var _darkModeStatus = false.obs;
  setDarkModeStatus(status) {
    _darkModeStatus.value = status;
  }

  bool get getDarkModeStatus => _darkModeStatus.value;
}
