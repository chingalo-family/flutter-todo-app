import 'package:flutter/material.dart';

class AppPopUpMenuItem {
  String id;
  String name;
  IconData icon;

  AppPopUpMenuItem({this.id, this.name, this.icon});

  @override
  String toString() {
    return 'item : $name';
  }

  static List<AppPopUpMenuItem> getPopUpMenuItems() {
    return [
      AppPopUpMenuItem(
          id: 'dark', name: 'Switch to Dark', icon: Icons.brightness_2),
      AppPopUpMenuItem(
          id: 'light', name: 'Switch to light', icon: Icons.brightness_low),
    ];
  }
}
