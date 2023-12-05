import 'package:circular_menu/design/app_routes.dart';
import 'package:flutter/material.dart';

class CircularMenu extends StatelessWidget {
  const CircularMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: AppRoutes.homePage,
    );
  }
}
