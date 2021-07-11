import 'package:flutter/material.dart';
import 'package:flutter_tab/model/screenmodel.dart';
import 'package:get/get.dart';
import '../main.dart';
import '../pages/all_pages.dart';

class NavigatorController extends GetxController {
  final screensData = <ScreensModel>[
    ScreensModel(screenName: 'red', navkey: 1, subScreenList: [
      SubNavItem(
        id: 0,
        screen: Profile(),
        screenName: 'Profile',
      ),
    ]),
    ScreensModel(screenName: 'green', navkey: 2, subScreenList: [
      SubNavItem(
        id: 0,
        screen: HomeView(),
        screenName: 'Homeview',
      ),
    ]),
    ScreensModel(screenName: 'blue', navkey: 3, subScreenList: [
      SubNavItem(
        id: 0,
        screen: SettingsPage(),
        screenName: 'SettingsPage',
      ),
      SubNavItem(
        id: 1,
        screen: Post(),
        screenName: 'Post',
      ),
    ]),
  ];
  final navCurrentIndex = 0.obs;

  get currentScreenmodel => screensData[navCurrentIndex()];

  List<Widget> _pages;

  List<Widget> get bottomMenuPages =>
      _pages ??= screensData.map((e) => TabNav(e)).toList();

  List<BottomNavigationBarItem> get navMenuItems => screensData
      .map((e) => BottomNavigationBarItem(
          icon: Icon(Icons.widgets), label: e.screenName))
      .toList();
}
