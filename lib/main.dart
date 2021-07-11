import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

class MyPersistentBottomNavBar extends StatelessWidget {
  final Widget child;
  MyPersistentBottomNavBar(this.child);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        ],
      ),
    );
  }
}

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
      _pages ??= screensData.map((e) => _TabNav(e)).toList();

  List<BottomNavigationBarItem> get navMenuItems => screensData
      .map((e) => BottomNavigationBarItem(
          icon: Icon(Icons.widgets), label: e.screenName))
      .toList();
}

class _TabNav extends GetView<NavigatorController> {
  final ScreensModel model;
  _TabNav(this.model);
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(model.navkey),
      onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (_) => MyChildAPpWidget(
                model: model,
              )),
    );
  }
}

class MyChildAPpWidget extends StatelessWidget {
  final ScreensModel model;
  MyChildAPpWidget({this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemBuilder: (ctx, index) => ListTile(
        title: Text(model.subScreenList[index].screenName),
        onTap: () {
          Get.to(
            model.subScreenList[index].screen,
            id: model.navkey,
          );
        },
      ),
      itemCount: model.subScreenList.length,
    ));
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Hello Homeview'),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Hello Settingspage'),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Hello Profile'),
      ),
    );
  }
}

class Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Hello Post'),
      ),
    );
  }
}

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
