import 'package:flutter/material.dart';

class DayWeatherCard extends StatefulWidget {
  final String? temperature;

  const DayWeatherCard({Key? key, this.temperature}) : super(key: key);

  @override
  State<DayWeatherCard> createState() => _DayWeatherCardState();
}

class _DayWeatherCardState extends State<DayWeatherCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 55,
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.white, style: BorderStyle.solid, width: 3),
          borderRadius: BorderRadius.circular(15)),
      child: Center(child: Text(widget.temperature.toString())),
    );
  }
}
