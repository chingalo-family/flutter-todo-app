import 'package:flutter/material.dart';

class AppPopUpMenuItem {
  String id;
  String name;
  IconData icon;

  AppPopUpMenuItem({required this.id, required this.name, required this.icon});

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
      AppPopUpMenuItem(id: 'about', name: 'About', icon: Icons.info)
    ];
  }
}
