import 'package:flutter/material.dart';
import 'package:fluthear/widgets/single_day.dart';

class SevenDaysPage extends StatefulWidget {
  const SevenDaysPage({Key? key}) : super(key: key);

  @override
  State<SevenDaysPage> createState() => _SevenDaysPageState();
}

class _SevenDaysPageState extends State<SevenDaysPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(),
            ListView(
              scrollDirection: Axis.vertical,
              children: [Container(), SingleDayWeather()],
            )
          ],
        ),
      ),
    );
  }
}
