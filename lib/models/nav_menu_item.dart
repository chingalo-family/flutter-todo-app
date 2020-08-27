import 'package:flutter/material.dart';

class NavMenuItem {
  String title;
  IconData icon;
  NavMenuItem({this.icon, this.title});

  static List<NavMenuItem> getNavMenuItems() {
    return [
      NavMenuItem(title: 'Home', icon: Icons.home),
      NavMenuItem(title: 'Todo', icon: Icons.list),
    ];
  }
}
