import 'package:eco_ride/widgets/logo.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _email = '';
  String _pwd = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              //logo
              Center(child: Logo()),

              //titulo
              Titulo(),
              Divider(),
              SizedBox(
                height: 30.0,
              ),
              _crearEmail(),
              SizedBox(
                height: 30.0,
              ),
              _crearPassword('Nueva contraseña', 'Contraseña'),
              SizedBox(
                height: 30.0,
              ),
              _crearPassword('Digite nuevamente la contraseña', 'Contraseña'),
              SizedBox(
                height: 30.0,
              ),
              SizedBox(
                height: 30.0,
              ),
              //Botones
              ElevatedButton(
                  onPressed: () {
                    _mostrarAlerta(context);
                  },
                  child: Text('Registrarse')),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Volver'))
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Se harealizado el registro'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Se ha realizado el registro exitosamente'),
            ],
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, 'login');
                },
                child: Text('Ok')),
          ],
        );
      },
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

  Widget _crearPassword(String text, String text2) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: text,
        labelText: text2,
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

class Titulo extends StatelessWidget {
  const Titulo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Registro',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ],
    );
  }
}
