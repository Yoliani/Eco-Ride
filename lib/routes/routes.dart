import 'package:eco_ride/pages/home_page.dart';
import 'package:eco_ride/pages/login_page.dart';
import 'package:eco_ride/pages/recover_password_code.dart';
import 'package:eco_ride/pages/recover_password_page.dart';
import 'package:eco_ride/pages/register_page.dart';
import 'package:eco_ride/pages/start_page.dart';
import 'package:flutter/material.dart';

final rutas = <String, WidgetBuilder>{
  '/': (BuildContext context) => StartPage(),
  'login': (BuildContext context) => LoginPage(),
  'home': (BuildContext context) => HomePage(),
  'registro': (BuildContext context) => RegisterPage(),
  'contraseña': (BuildContext context) => PasswordPage(),
  'code_password': (BuildContext context) => PasswordCode(),
};

Map<String, WidgetBuilder> getAppRoutes() {
  return rutas;
}
