// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SingleDayWeather extends StatefulWidget {
  final int minTemp;
  final int maxTemp;
  const SingleDayWeather({Key? key, this.minTemp = -5, this.maxTemp = 20})
      : super(key: key);

  @override
  State<SingleDayWeather> createState() => _SingleDayWeatherState();
}

class _SingleDayWeatherState extends State<SingleDayWeather> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(right: 40, left: 40, top: 15),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Mon',
            style: TextStyle(color: Color.fromARGB(150, 255, 255, 255)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 7),
                child: Image.asset(
                  'assets/images/crystal_cloud.png',
                  width: 42,
                ),
              ),
              Text('Rainy',
                  style: TextStyle(color: Color.fromARGB(150, 255, 255, 255)))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                '${widget.maxTemp.toString()}°',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '${widget.minTemp.toString()}°',
                style: TextStyle(color: Color.fromARGB(130, 255, 255, 255)),
              )
            ],
          )
        ]),
      ),
    );
  }
}
