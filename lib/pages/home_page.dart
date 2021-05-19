import 'package:eco_ride/providers/home_provider.dart';
import 'package:eco_ride/providers/tour_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  final _style = new TextStyle(fontSize: 18);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            actions: [],
            bottom: PreferredSize(
                preferredSize: Size(40, 40),
                child: Container(
                  child: TabBar(
                    tabs: [
                      Text(
                        'Promociones',
                        style: _style,
                      ),
                      Text(
                        'Bicicletas',
                        style: _style,
                      ),
                      Text(
                        'Tours',
                        style: _style,
                      ),
                    ],
                  ),
                )),
          ),
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          drawer: Menu(),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: TabBarView(
              children: [
                Promociones(),
                Promociones(),
                Tours(),
              ],
            ),
          )),
    );
  }
}

class Promociones extends StatelessWidget {
  const Promociones({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _lista();
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = Card(
        //Sombra en los bordes
        elevation: 10.0,
        //
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Container(
                height: 90.0,
                width: 90.0,
                decoration: BoxDecoration(
                  color: Colors.yellow, //PARA PROBAR CONTAINER
                  borderRadius: new BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(opt['imagen']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(opt['nombre']),
              subtitle: Text('Aqui va la descripcion'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(onPressed: () {}, child: Text('Alquilar')),
                TextButton(onPressed: () {}, child: Text('Comprar')),
                TextButton(onPressed: () {}, child: Text('Ver más')),
              ],
            )
          ],
        ),
      );

      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}

class Tours extends StatelessWidget {
  const Tours({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _lista2();
  }

  Widget _lista2() {
    return FutureBuilder(
      future: tourProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems2(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems2(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = Card(
        //Sombra en los bordes
        elevation: 10.0,
        //

        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Container(
                height: 90.0,
                width: 90.0,
                decoration: BoxDecoration(
                  color: Colors.yellow, //PARA PROBAR CONTAINER
                  borderRadius: new BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(opt['imagen']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(opt['nombre']),
              subtitle: Text(
                opt['descripcion'],
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(onPressed: () {}, child: Text('Comprar Tour')),
                TextButton(onPressed: () {}, child: Text('Ver más')),
              ],
            )
          ],
        ),
      );

      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}

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
            onTap: () {
              Navigator.pushNamed(context, 'login');
            },
          ),
        ],
      ),
    );
  }
}
