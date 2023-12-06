import 'package:flutter/material.dart';

import 'package:circular_menu/models/menu_option.dart';

class Mocks {
  Mocks._();

  static List<MenuOption> listMenuOption = [
    MenuOption(icon: Icons.favorite, label: "Favorite"),
    MenuOption(icon: Icons.cake, label: "Food"),
    MenuOption(icon: Icons.accessibility, label: "Accessibility"),
    MenuOption(icon: Icons.comment, label: "Comments"),
    MenuOption(icon: Icons.event, label: "Events"),
    MenuOption(icon: Icons.medication, label: "Medication"),
    MenuOption(icon: Icons.wifi, label: "Wifi"),
  ];
}
