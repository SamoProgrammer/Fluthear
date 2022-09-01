// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
class SingleDayWeather extends StatefulWidget {
  const SingleDayWeather({Key? key}) : super(key: key);

  @override
  State<SingleDayWeather> createState() => _SingleDayWeatherState();
}

class _SingleDayWeatherState extends State<SingleDayWeather> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text('Mon'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(''), Text('Rainy')],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              '+20°',
              style: TextStyle(color: Colors.white),
            ),Text(
              '-5°',
              style: TextStyle(color: Color.fromARGB(130, 255, 255, 255)),
            )
          ],
        )
      ]),
    );
  }
}
