import 'package:flutter/material.dart';

class AppRouter{
  static final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static pushWithReplacment(Widget widget) {
    Navigator.of(navKey.currentContext!)
        .pushReplacement(MaterialPageRoute(builder: (context) => widget));
  }

  static pushWidget(Widget widget) {
    Navigator.of(navKey.currentContext!)
        .push(MaterialPageRoute(builder: (context) => widget));
  }

  static popWidget() {
    Navigator.pop(navKey.currentContext!);
  }

}