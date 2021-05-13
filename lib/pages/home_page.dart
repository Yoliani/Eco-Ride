import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EcoRide'),
        actions: [],
      ),
      backgroundColor: Colors.white,
      drawer: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5.0),
            ),
            margin: EdgeInsets.only(right: 100),
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
    );
  }
}
