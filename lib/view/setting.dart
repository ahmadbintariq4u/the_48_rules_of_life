import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:the_life/controller/setting_controller.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> with AutomaticKeepAliveClientMixin {
  SMIInput<bool>? _isDarkModeInput;
  Artboard? _playButtonArtboard;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    rootBundle.load('animations/dark_light_mode.riv').then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      var controller = StateMachineController.fromArtboard(
        artboard,
        'DarkMode',
      );
      if (controller != null) {
        artboard.addController(controller);
        _isDarkModeInput = controller.findInput('isDarkMode');
      }
      setState(
        () => _playButtonArtboard = artboard,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      slivers: [myAppBar(context), myRemainingSpace()],
    );
  }

  SliverAppBar myAppBar(context) => SliverAppBar(
        elevation: 30,
        backgroundColor: Colors.blueAccent,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100))),
        floating: true,
        pinned: true,
        collapsedHeight: MediaQuery.of(context).size.height * 0.1,
        title: AutoSizeText.rich(
          TextSpan(
            text: 'Settings',
            style: GoogleFonts.carterOne(
                fontSize: MediaQuery.of(context).size.width * 0.06),
          ),
        ),
        centerTitle: true,
      );

  SliverFillRemaining myRemainingSpace() => SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Tile_1
          _playButtonArtboard == null
              ? FlutterLogo()
              : Container(
                  height: 240,
                  width: 380,
                  alignment: Alignment.center,
                  child: Rive(
                    useArtboardSize: true,
                    alignment: Alignment.center,
                    antialiasing: true,
                    artboard: _playButtonArtboard!,
                    fit: BoxFit.fill,
                  ),
                ),

          /// Tile_2
          ListTile(
            minLeadingWidth: 10,
            leading: Icon(Icons.lightbulb),
            horizontalTitleGap: 10,
            title: Text('Appearance',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'forte')),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ListTile(
              horizontalTitleGap: 0.5,
              title: Text('Dark Mode'),
              trailing: GetX<SettingController>(
                init: SettingController(),
                initState: (_) {},
                builder: (controller) {
                  return Switch(
                    value: controller.getDarkModeStatus,
                    onChanged: (value) {
                      if (!value) {
                        if (Get.isDarkMode) {
                          Get.changeThemeMode(ThemeMode.light);
                          controller.setDarkModeStatus(value);
                          _darkLightModeAnimation();
                        }
                      } else {
                        Get.changeThemeMode(ThemeMode.dark);
                        controller.setDarkModeStatus(value);
                        _darkLightModeAnimation();
                      }

                      // Get.changeTheme(ThemeData.dark());
                    },
                  );
                },
              ),
            ),
          ),

          /// Tile_3
          ListTile(
            minLeadingWidth: 10,
            leading: Icon(Icons.notifications),
            horizontalTitleGap: 10,
            title: Text('Notifications',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'forte')),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ListTile(
              title: Text('Local Notifications'),
              trailing: GetX<SettingController>(
                init: SettingController(),
                initState: (_) {},
                builder: (controller) {
                  return Switch(
                    value: controller.getDarkModeStatus,
                    onChanged: (value) {
                      if (!value) {
                        if (Get.isDarkMode) {
                          Get.changeThemeMode(ThemeMode.light);
                          controller.setDarkModeStatus(value);
                          _darkLightModeAnimation();
                        }
                      } else {
                        Get.changeThemeMode(ThemeMode.dark);
                        controller.setDarkModeStatus(value);
                        _darkLightModeAnimation();
                      }

                      // Get.changeTheme(ThemeData.dark());
                    },
                  );
                },
              ),
            ),
          ),

          /// Tile_4
          Divider(
            indent: 20,
            endIndent: 20,
            height: 4,
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text('VERSION 1.0'),
          ))
          // Image.asset('assets/icon.png')
        ],
      ));

  void _darkLightModeAnimation() {
    _isDarkModeInput?.controller.isActive = false;

    if (_isDarkModeInput?.value == false &&
        _isDarkModeInput?.controller.isActive == false) {
      _isDarkModeInput?.value = true;
    } else if (_isDarkModeInput?.value == true &&
        _isDarkModeInput?.controller.isActive == false) {
      _isDarkModeInput?.value = false;
    }
  }
}
