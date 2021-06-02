import 'package:eco_ride/widgets/menu.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      drawer: Menu(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://dam.esquirelat.com/wp-content/uploads/2020/07/STANLEE.jpg'),
                  radius: 200.0,
                ),
                padding: EdgeInsets.all(2.0),
              ),
              SizedBox(height: 20),
              Text(
                'Stan Lee',
                style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              ),
              Text(
                'Número de telefono',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              // Text(
              //   '+57 3189023234',
              //   style: TextStyle(
              //     fontSize: 20,
              //   ),
              // ),
              ListTile(
                leading: Icon(Icons.remove_red_eye_outlined),
                title: Text('Ver informacíon'),
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Editar informacíon'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
