import 'package:eco_ride/pages/datos/datos_extra.dart';
import 'package:eco_ride/pages/home_page.dart';
import 'package:eco_ride/pages/login_page.dart';
import 'package:eco_ride/pages/products/productos_page.dart';
import 'package:eco_ride/pages/profile/profile_page.dart';
import 'package:eco_ride/pages/recover_password_code.dart';
import 'package:eco_ride/pages/recover_password_page.dart';
import 'package:eco_ride/pages/register_page.dart';
import 'package:eco_ride/pages/settings/configuracion_page.dart';
import 'package:eco_ride/pages/start_page.dart';
import 'package:flutter/material.dart';

final rutas = <String, WidgetBuilder>{
  '/': (BuildContext context) => StartPage(),
  'login': (BuildContext context) => LoginPage(),
  'home': (BuildContext context) => HomePage(),
  'registro': (BuildContext context) => RegisterPage(),
  'contraseña': (BuildContext context) => PasswordPage(),
  'code_password': (BuildContext context) => PasswordCode(),
  'datos_extra': (BuildContext context) => DatosExtra(),
  'settings': (BuildContext context) => Settings(),
  'perfil': (BuildContext context) => Perfil(),
  'pedidos': (BuildContext context) => Products(),
};

Map<String, WidgetBuilder> getAppRoutes() {
  return rutas;
}
