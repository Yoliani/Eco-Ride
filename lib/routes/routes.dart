import 'package:eco_ride/pages/home_page.dart';
import 'package:eco_ride/pages/start_page.dart';
import 'package:flutter/material.dart';

final rutas = <String, WidgetBuilder>{
  //'/': (BuildContext context) => SplashScreen(),
  '/': (BuildContext context) => StartPage(),
  'home': (BuildContext context) => HomePage(),
};

Map<String, WidgetBuilder> getAppRoutes() {
  return rutas;
}
