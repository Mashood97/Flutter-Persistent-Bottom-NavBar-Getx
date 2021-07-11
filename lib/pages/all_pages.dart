import 'package:flutter/material.dart';
import 'package:flutter_tab/model/screenmodel.dart';
import 'package:get/get.dart';

class MyCustomSubNavigator extends StatelessWidget {
  final ScreensModel model;
  MyCustomSubNavigator({this.model});
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
