// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DayWeatherCard extends StatefulWidget {
  final String temperature;
  final String time;
  final bool isNow;
  const DayWeatherCard(
      {Key? key,
      required this.temperature,
      required this.time,
      this.isNow = false})
      : super(key: key);
  @override
  State<DayWeatherCard> createState() => _DayWeatherCardState();
}

class _DayWeatherCardState extends State<DayWeatherCard> {
  var cardHeight = 100;
  var cardWidth = 72;
  var cardColor = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    if (widget.isNow) {
      cardHeight = 115;
      cardWidth = 80;
      cardColor = Color.fromARGB(255, 17, 105, 243);
    }
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Container(
        height: cardHeight.toDouble(),
        width: cardWidth.toDouble(),
        decoration: BoxDecoration(
            color: cardColor,
            border: Border.all(
                color: Colors.white, style: BorderStyle.solid, width: 1),
            borderRadius: BorderRadius.circular(26)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.temperature,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Image.asset(
              'assets/images/crystal_cloud.png',
              width: 55,
            ),
            Text(
              widget.time,
              style: TextStyle(
                  color: Color.fromARGB(150, 255, 255, 255), fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
