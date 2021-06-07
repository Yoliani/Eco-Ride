import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
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
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    "https://dam.esquirelat.com/wp-content/uploads/2020/07/STANLEE.jpg"),
              ),
              Text('Stan Lee',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ]),
          ),
          ListTile(
            leading: Icon(Icons.money),
            title: Text('Productos'),
            onTap: () {
              Navigator.popAndPushNamed(context, 'home');
            },
          ),
          ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text('Pedidos'),
              onTap: () => Navigator.popAndPushNamed(context, 'pedidos')),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Perfil'),
            onTap: () => Navigator.popAndPushNamed(context, 'perfil'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configuración'),
            onTap: () {
              Navigator.pushNamed(context, 'settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Cerrar sesion'),
            onTap: () {
              Navigator.pushNamed(context, 'login');
            },
          ),
        ],
      ),
    );
  }
}
