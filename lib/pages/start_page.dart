import 'package:eco_ride/pages/home_page.dart';
import 'package:eco_ride/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class StartPage extends StatelessWidget {
  //final StartPage({Key key}) : super(key: key);
  final List _imageList = [
    'https://sicex.com/wp-content/uploads/2020/06/reporte-sector-bicicletas-importacion-exportacion-latinoamerica-scaled.jpg',
    'https://s3.amazonaws.com/mercado-ideas/wp-content/uploads/sites/2/2018/10/28104459/tipos-de-bicicleta-bigstock.jpg',
    'https://cdn.aarp.net/content/dam/aarp/home-and-family/your-home/2020/07/1140-e-bikes-couple-2-esp.imgcache.rev.web.900.513.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final _swipersize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.indigoAccent,
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Swiper(
                  autoplay: true,
                  layout: SwiperLayout.TINDER,
                  itemCount: _imageList.length,
                  itemHeight: _swipersize.height * 0.7,
                  itemWidth: _swipersize.width * 0.9,
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
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 50,
                child: Text('Bienvenido a Eco Ride'),
              ),
              ElevatedButton(
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
              )
            ],
          ),
        ));
  }
}
