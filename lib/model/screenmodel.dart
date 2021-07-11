import 'package:flutter/material.dart';

class ScreensModel {
  final String screenName;
  final int navkey;
  final List<SubNavItem> subScreenList;

  ScreensModel({
    this.navkey,
    this.screenName,
    this.subScreenList,
  });
}

class SubNavItem {
  final String screenName;
  final Widget screen;
  final int id;
  SubNavItem({
    this.id,
    this.screenName,
    this.screen,
  });
}
