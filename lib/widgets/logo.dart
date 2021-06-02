import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage('assets/logo.png'),
          fit: BoxFit.contain,
        ),
        Text(
          'Eco Ride',
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
