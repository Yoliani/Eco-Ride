import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EcoRide'),
        actions: [],
      ),
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              margin: EdgeInsets.only(right: 0),
              child: Column(children: [
                Text(
                  'Menú',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ]),
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text('Alquiler'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Perfil'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuración'),
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Cerrar sesion'),
            ),
          ],
        ),
      ),
    );
  }
}
