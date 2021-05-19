import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _TourProvider {
  List<dynamic> opciones = [];
  _TourProvider() {
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/tours.json');

    Map dataMap = json.decode(resp);
    opciones = dataMap['tours'];
    //print(opciones);
    return opciones;
  }
}

final tourProvider = new _TourProvider();
