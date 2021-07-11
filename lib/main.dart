import 'package:flutter/material.dart';
import 'package:flutter_tab/pages/all_pages.dart';
import 'package:get/get.dart';

import 'controller/nav_controller.dart';
import 'model/screenmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => NavigatorController(), fenix: true);

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends GetView<NavigatorController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          children: controller.bottomMenuPages,
          index: controller.navCurrentIndex(),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: controller.navMenuItems,
          currentIndex: controller.navCurrentIndex(),
          onTap: controller.navCurrentIndex,
        ),
      ),
    );
  }
}

class TabNav extends GetView<NavigatorController> {
  final ScreensModel model;
  TabNav(this.model);
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(model.navkey),
      onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (_) => MyCustomSubNavigator(
                model: model,
              )),
    );
  }
}
