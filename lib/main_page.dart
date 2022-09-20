import 'package:fluthear/services/pref_service.dart';
import 'package:fluthear/widgets/city_name_widget.dart';
import 'package:fluthear/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:fluthear/widgets/day_weather_card.dart';
import 'package:weather/weather.dart';
import 'api/open_weather.dart';
import 'package:intl/intl.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PrefService prefService = PrefService();
  bool isSeachFieldEnabled = false;
  Weather? _currentWeatherModel;
  List<Weather>? _currentForecastModel;
  double? temprature = 0;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    if (!(await prefService.checkCache())) {
      await prefService.setCache('Tehran');
    }
    var temp = await prefService.readCache();
    _currentWeatherModel = await OpenWeather().getCurrentOpenWeather(temp);
    _currentForecastModel = await OpenWeather().getForecastByCity(temp);
    Future.delayed(const Duration(milliseconds: 1))
        .then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(scrollDirection: Axis.vertical, children: [
        Column(
          children: [
            Container(
              height: 625,
              margin: EdgeInsets.only(left: 9, top: 9, right: 9),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: isSeachFieldEnabled
                                    ? Icon(
                                        Icons.close,
                                        size: 26,
                                      )
                                    : Icon(
                                        Icons.location_on,
                                        size: 26,
                                      ),
                                color: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    isSeachFieldEnabled =
                                        isSeachFieldEnabled ? false : true;
                                  });
                                },
                              ),
                              isSeachFieldEnabled
                                  ? SearchFieldWidget()
                                  : CityNameWidget()
                            ],
                          ),
                        ],
                      ),
                      Container(
                          alignment: Alignment.topCenter,
                          height: 250,
                          child: Image.asset(
                              'assets/images/lightining_cloud.png')),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          height: 145,
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Text(
                                '${_currentWeatherModel!.temperature!.celsius!.toInt()}°',
                                style: TextStyle(
                                    fontSize: 130,
                                    fontFamily: 'Vitro',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    height: 0.75),
                              ),
                              Text(
                                _currentWeatherModel!.weatherDescription!,
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              Text(
                                DateFormat('EEEE')
                                    .format(_currentWeatherModel!.date!)
                                    .capitalize(),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 155, 200, 246)),
                              )
                            ],
                          ),
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
                                  '${_currentWeatherModel!.windSpeed!} m/s',
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
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 7),
                                  child: Icon(
                                    Icons.water_drop,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '${_currentWeatherModel!.humidity!}%',
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
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 7),
                                  child: Icon(
                                    Icons.cloud,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '${_currentWeatherModel!.cloudiness!}%',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Cloudiness',
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
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Today Forecast',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DayWeatherCard(
                      temperature:
                          "${_currentForecastModel![0].temperature!.celsius!.toInt()}°",
                      time:
                          "${_currentForecastModel![0].date!.hour}:${_currentForecastModel![0].date!.minute}",
                      isNow: true,
                    ),
                    DayWeatherCard(
                      temperature:
                          "${_currentForecastModel![1].temperature!.celsius!.toInt()}°",
                      time:
                          "${_currentForecastModel![1].date!.hour}:${_currentForecastModel![0].date!.minute}",
                    ),
                    DayWeatherCard(
                      temperature:
                          "${_currentForecastModel![2].temperature!.celsius!.toInt()}°",
                      time:
                          "${_currentForecastModel![2].date!.hour}:${_currentForecastModel![0].date!.minute}",
                    ),
                    DayWeatherCard(
                      temperature:
                          "${_currentForecastModel![3].temperature!.celsius!.toInt()}°",
                      time:
                          "${_currentForecastModel![3].date!.hour}:${_currentForecastModel![0].date!.minute}",
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ]),
      backgroundColor: Color.fromARGB(255, 1, 12, 29),
    );
  }
}
