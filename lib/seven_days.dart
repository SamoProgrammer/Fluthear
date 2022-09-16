// ignore_for_file: prefer_const_constructors

import 'package:fluthear/main_page.dart';
import 'package:flutter/material.dart';
// import 'package:weather/weather.dart';
import 'package:fluthear/widgets/single_day.dart';
// import 'api/open_weather.dart';

class SevenDaysPage extends StatefulWidget {
  const SevenDaysPage({Key? key}) : super(key: key);

  @override
  State<SevenDaysPage> createState() => _SevenDaysPageState();
}

class _SevenDaysPageState extends State<SevenDaysPage> {
  // List<Weather>? forecastWeather;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _getData();
  // }

  // void _getData() async {
  //   forecastWeather = await OpenWeather().getForecastByCity('Mashhad');
  //   Future.delayed(const Duration(milliseconds: 1))
  //       .then((value) => setState(() {}));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 30, 30, 30),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 385,
              margin: EdgeInsets.only(left: 9, top: 9, right: 9),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 18, 180, 252),
                        Color.fromARGB(255, 17, 105, 243),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp)),
              child: Container(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainPage()));
                            },
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                    color: Color.fromARGB(120, 255, 255, 255)),
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(18),
                                primary: Colors.transparent,
                                onPrimary: Colors.transparent),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Icon(
                                Icons.history,
                                size: 26,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text('7 Days',
                                    style: TextStyle(
                                        fontSize: 26, color: Colors.white)),
                              ),
                            ],
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(color: Colors.transparent),
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(16),
                                primary: Colors.transparent,
                                onPrimary: Colors.transparent),
                            child: Icon(Icons.more_vert,
                                color: Colors.white, size: 28),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/images/lightining_cloud.png',
                              height: 130,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ' Tomorrow',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Text(
                                        '20',
                                        style: TextStyle(
                                            fontSize: 80,
                                            fontFamily: 'Vitro',
                                            color: Colors.white,
                                            height: 0.75),
                                      ),
                                      Text(
                                        '/17°',
                                        style: TextStyle(
                                            fontSize: 40,
                                            color: Color.fromARGB(
                                                150, 255, 255, 255)),
                                      )
                                    ],
                                  ),
                                ),
                                Text(' Rainy - Cloudy',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(150, 255, 255, 255)))
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, bottom: 30),
                        child: Container(
                          height: 1,
                          color: Color.fromARGB(50, 255, 255, 255),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 7),
                                  child: Icon(
                                    Icons.wind_power,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '13 km/h',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Wind',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(130, 255, 255, 255)),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 7),
                                  child: Icon(
                                    Icons.water_drop,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '24%',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Humidity',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(130, 255, 255, 255)),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 7),
                                  child: Icon(
                                    Icons.umbrella,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '87%',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Chance of rain',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(130, 255, 255, 255)),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SingleDayWeather(maxTemp: 25),
            SingleDayWeather(maxTemp: 27),
            SingleDayWeather(maxTemp: 32),
          ],
        ),
      ),
    );
  }
}
