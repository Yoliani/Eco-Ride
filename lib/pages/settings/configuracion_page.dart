import 'package:eco_ride/widgets/menu.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _modooscuro = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Configuración'),
      ),
      drawer: Menu(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.report_problem_sharp),
                title: Text('Informar algún problema'),
                onTap: () {
                  // Navigator.popAndPushNamed(context, 'home');
                },
              ),
              ListTile(
                leading: Icon(Icons.text_snippet_sharp),
                title: Text('Hacer un PQR'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Cambiar configuracion del perfil'),
                //onTap: () => Navigator.popAndPushNamed(context, 'perfil'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
