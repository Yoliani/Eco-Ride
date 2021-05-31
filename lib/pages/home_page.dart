import 'package:eco_ride/providers/home_provider.dart';
import 'package:eco_ride/providers/tour_provider.dart';
import 'package:eco_ride/widgets/menu.dart';
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
          key: _scaffoldKey,
          appBar: appBarM(() {
            _scaffoldKey.currentState.openDrawer();
          }),
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

  Widget appBarM(VoidCallback voidCallback) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(7)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                    decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: IconButton(
                      icon: Icon(Icons.menu, color: Colors.black),
                      onPressed: voidCallback),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.more_vert, color: Colors.black),
                        onPressed: () {}),
                    CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(
                            "https://dam.esquirelat.com/wp-content/uploads/2020/07/STANLEE.jpg"))
                  ],
                ),
              )
            ],
          )),
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
