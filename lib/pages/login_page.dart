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
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Container(
            child: Column(),
            padding: EdgeInsets.all(200),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'http://bikehike.co/wp-content/uploads/2020/08/foto-portada-slider07.jpg'),
                alignment: Alignment.center,
              ),
            ),
          ),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword()
        ],
      ),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        labelText: 'Email',
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
