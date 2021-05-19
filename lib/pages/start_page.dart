import 'dart:async';

import 'package:eco_ride/pages/home_page.dart';
import 'package:eco_ride/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final List _imageList = [
    'https://sicex.com/wp-content/uploads/2020/06/reporte-sector-bicicletas-importacion-exportacion-latinoamerica-scaled.jpg',
    'https://s3.amazonaws.com/mercado-ideas/wp-content/uploads/sites/2/2018/10/28104459/tipos-de-bicicleta-bigstock.jpg',
    'https://cdn.aarp.net/content/dam/aarp/home-and-family/your-home/2020/07/1140-e-bikes-couple-2-esp.imgcache.rev.web.900.513.jpg',
  ];
  Timer _timer;
  @override
  Widget build(BuildContext context) {
    final _swipersize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: <Widget>[
              //Tarjetas
              CardSwiperBike(imageList: _imageList, swipersize: _swipersize),
              SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 50,
                child: Text(
                  'Bienvenido a Eco Ride',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),

              //Boton siguiente
              NextButtom()
            ],
          ),
        ));
  }

  void _initializeTimer() {
    _timer = Timer.periodic(const Duration(seconds: 20), (_) => _logOutUser);
  }

  void _logOutUser() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
        (route) => false);
    _timer.cancel();
  }
}

class CardSwiperBike extends StatelessWidget {
  const CardSwiperBike({
    Key key,
    @required List imageList,
    @required Size swipersize,
  })  : _imageList = imageList,
        _swipersize = swipersize,
        super(key: key);

  final List _imageList;
  final Size _swipersize;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Swiper(
        autoplay: true,
        layout: SwiperLayout.TINDER,
        itemCount: _imageList.length,
        itemHeight: _swipersize.height * 0.7,
        itemWidth: _swipersize.width * 0.8,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            child: Image(
              image: NetworkImage(_imageList[index]),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
          );
        },
      ),
    );
  }
}

class NextButtom extends StatelessWidget {
  const NextButtom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.teal,
        onPrimary: Colors.white,
        onSurface: Colors.grey,
        shadowColor: Colors.red,
        elevation: 5,
        /*shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(8)),*/
      ),
      onPressed: () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
            (route) => false);
      },
      child: Text('Siguiente'),
    );
  }
}
