import 'package:eco_ride/providers/home_provider.dart';
import 'package:eco_ride/providers/tour_provider.dart';
import 'package:eco_ride/widgets/menu.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final _style = new TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Pedidos"),
              bottom: PreferredSize(
                  preferredSize: Size(40, 40),
                  child: Container(
                    child: TabBar(
                      tabs: [
                        Text(
                          'Pendientes',
                          style: _style,
                        ),
                        Text(
                          'Vigentes',
                          style: _style,
                        ),
                        Text(
                          'Historial',
                          style: _style,
                        ),
                      ],
                    ),
                  )),
            ),
            drawer: Menu(),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: TabBarView(
                children: [
                  Promociones(),
                  Tours(),
                  Column()
                  //Tours(),
                ],
              ),
            )));
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
    final _estilo = new TextStyle(fontSize: 16);
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
              subtitle: Text(opt['descripcion']),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Precio: ' + (opt['precio_compra']),
                    style: _estilo,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Marca: ' + opt['marca'],
                    style: _estilo,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Tipo: ' + opt['tipo'],
                    style: _estilo,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(onPressed: () {}, child: Text('Pagar')),
                      TextButton(
                          onPressed: () {}, child: Text('Cancelar pedido'))
                    ],
                  )
                ],
              ),
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Descripcion: " + opt['descripcion'],
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Precio: ' + opt['precio']),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text('Información del pedido')),
                      TextButton(onPressed: () {}, child: Text('Reembolso'))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );

      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}
