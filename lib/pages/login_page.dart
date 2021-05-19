import 'package:eco_ride/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _pwd = '';
  @override
  Widget build(BuildContext context) {
    final _screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              //Logo
              Logo(),
              SizedBox(
                height: 10,
              ),
              //Titulo

              Titulo(),
              Divider(),
              SizedBox(
                height: 40,
              ),
              _crearEmail(),
              SizedBox(
                height: 30.0,
              ),
              _crearPassword(),
              SizedBox(height: 40),
              //olvidar contraseña
              OlvidarContrasena(),
              SizedBox(height: 40),
              //Botones
              IniciarSesion(),
              SizedBox(
                height: 20,
              ),
              Registrarse(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Correo',
        labelText: 'Correo',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      onChanged: (valor) {
        setState(() {
          _pwd = valor;
        });
      },
    );
  }
}

class IniciarSesion extends StatelessWidget {
  const IniciarSesion({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 110),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'home');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.login,
                  size: 30,
                ),
                Text(
                  'Iniciar sesión',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.teal,
              onPrimary: Colors.white,
              onSurface: Colors.grey,
              shadowColor: Colors.red,
              elevation: 5,
            ),
          ),
        ],
      ),
    );
  }
}

class OlvidarContrasena extends StatelessWidget {
  const OlvidarContrasena({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        '¿Olvido la contraseña?',
        style: TextStyle(
          fontSize: 15,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, 'contraseña');
      },
    );
  }
}

class Registrarse extends StatelessWidget {
  const Registrarse({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        'Registrarse',
        style: TextStyle(
          fontSize: 15,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, 'registro');
      },
    );
  }
}

class Titulo extends StatelessWidget {
  const Titulo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Inicio de sesión',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ],
    );
  }
}
