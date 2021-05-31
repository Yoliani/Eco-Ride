import 'package:eco_ride/widgets/menu.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Configuración'),
      ),
      drawer: Menu(),
      body: Container(
        child: Column(
          children: [
            ListView(
              children: [
                ListTile(
                  title: Text('Modo Oscuro'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
