import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'package:circular_menu/models/menu_option.dart';

class MenuItemWidget extends StatelessWidget {
  final Offset offset, textOffset;
  final MenuOption menuOption;

  const MenuItemWidget({
    Key? key,
    required this.offset,
    required this.textOffset,
    required this.menuOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: Stack(alignment: Alignment.center, children: <Widget>[
        Transform.translate(
          offset: textOffset,
          child: SizedBox(
              width: 100,
              child: Text(
                menuOption.label,
                textAlign: TextAlign.right,
              )),
        ),
        MaterialButton(
          onPressed: () => print(menuOption.label),
          padding: EdgeInsets.zero,
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
                color: Colors.redAccent, shape: BoxShape.circle),
            child: Center(
              child: Icon(
                menuOption.icon,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
