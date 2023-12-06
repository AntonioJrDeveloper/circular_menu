import 'package:flutter/material.dart';

import 'package:circular_menu/design/app_routes.dart';
import 'package:circular_menu/pages/home_page.dart';

class CircularMenu extends StatelessWidget {
  const CircularMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: AppRoutes.homePage,
      routes: {
        AppRoutes.homePage: (_) => const HomePage(),
      },
    );
  }
}
