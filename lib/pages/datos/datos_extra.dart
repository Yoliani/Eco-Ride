import 'package:eco_ride/widgets/logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DatosExtra extends StatefulWidget {
  @override
  _DatosExtraState createState() => _DatosExtraState();
}

class _DatosExtraState extends State<DatosExtra> {
  final _controller =
      PageController(viewportFraction: 0.8, initialPage: 0, keepPage: false);
  String _texto = 'Datos básicos';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_texto),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 16),
                SizedBox(
                  height: 700,
                  width: 800,
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    //reverse: true,
                    scrollDirection: Axis.horizontal,
                    dragStartBehavior: DragStartBehavior.down,
                    controller: _controller,
                    children: [
                      PrimeraPagina(),
                      UltimaPagina(context),
                      // Column(
                      //   children: [
                      //     Text('Hola2'),
                      //     ElevatedButton(
                      //         onPressed: () {
                      //           _controller.jumpToPage(0);
                      //         },
                      //         child: Text('Siguiente')),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                Container(
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 2,
                    effect: WormEffect(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget UltimaPagina(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(45.0),
          child: Text(
              'Aliquip adipisicing officia ad aliqua. Incididunt dolor amet veniam pariatur aliquip sunt velit. Duis id dolore voluptate ea non ex qui. Duis cupidatat sint sit elit sint officia anim nisi mollit. Adipisicing voluptate nisi laboris exercitation dolor laborum adipisicing reprehenderit id pariatur irure.'),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //_setImageView(),
              Card(
                child: Image(
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'http://clubesarg.com.ar/depo/fotos/F000000.jpg'),
                ),
              )
            ],
          ),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, 'home', (route) => false);
            },
            child: Text('Seleccione una imagen')),
        SizedBox(
          height: 20,
        ),
        //Checkbox(value: false, onChanged: (bool n) {}),
        SizedBox(
          height: 60,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, 'home', (route) => false);
            },
            child: Text('Finalizar'))
      ],
    );
  }

  Widget PrimeraPagina() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          Logo(),
          SizedBox(
            height: 10,
          ),
          inputTextField('Número de telefono', Icon(Icons.confirmation_number)),
          SizedBox(
            height: 10,
          ),
          inputTextField('Nombre y Apellidos', Icon(Icons.confirmation_number)),
          SizedBox(
            height: 10,
          ),
          inputTextField(
              'Número de documento', Icon(Icons.confirmation_number)),
          SizedBox(
            height: 10,
          ),
          inputTextField('Correo personal', Icon(Icons.confirmation_number)),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                _controller.jumpToPage(1);
                setState(() {
                  _texto = 'Foto de perfil';
                });
              },
              child: Text('Siguiente'))
        ],
      ),
    );
  }

  Widget inputTextField(String texto, Icon icono) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: texto,
        labelText: texto,
        suffixIcon: icono,
        //icon: icono,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      onChanged: (valor) {},
    );
  }
}
