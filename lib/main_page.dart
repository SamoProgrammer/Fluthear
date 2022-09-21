

import 'package:fluthear/forecast_page.dart';
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
              height: 555,
              margin: const EdgeInsets.only(left: 9, top: 9, right: 9),
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
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
                                    ? const Icon(
                                        Icons.close,
                                        size: 26,
                                      )
                                    : const Icon(
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
                                  ? const SearchFieldWidget()
                                  : const CityNameWidget()
                            ],
                          ),
                        ],
                      ),
                      Container(
                          alignment: Alignment.topCenter,
                          height: 230,
                          child: Image.asset(OpenWeather()
                              .getImageByDescription(
                                  _currentWeatherModel!.weatherDescription!,
                                  _currentWeatherModel!.date!.hour))),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 7),
                        child: Container(
                          height: 145,
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Text(
                                '${_currentWeatherModel!.temperature!.celsius!.toInt()}°',
                                style: const TextStyle(
                                    fontSize: 130,
                                    fontFamily: 'Vitro',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    height: 0.75),
                              ),
                              Text(
                                _currentWeatherModel!.weatherDescription!,
                                style: const TextStyle(
                                    fontSize: 22,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              Text(
                                DateFormat('EEEE')
                                    .format(_currentWeatherModel!.date!)
                                    .capitalize(),
                                style: const TextStyle(
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
                          color: const Color.fromARGB(50, 255, 255, 255),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 7),
                                child: Icon(
                                  Icons.wind_power,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${_currentWeatherModel!.windSpeed!} m/s',
                                style: const TextStyle(color: Colors.white),
                              ),
                              const Text(
                                'Wind',
                                style: TextStyle(
                                    color:
                                       Color.fromARGB(130, 255, 255, 255)),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 7),
                                child: Icon(
                                  Icons.water_drop,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${_currentWeatherModel!.humidity!}%',
                                style: const TextStyle(color: Colors.white),
                              ),
                              const Text(
                                'Humidity',
                                style: TextStyle(
                                    color:
                                        Color.fromARGB(130, 255, 255, 255)),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 7),
                                child: Icon(
                                  Icons.cloud,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${_currentWeatherModel!.cloudiness!}%',
                                style: const TextStyle(color: Colors.white),
                              ),
                              const Text(
                                'Cloudiness',
                                style: TextStyle(
                                    color:
                                        Color.fromARGB(130, 255, 255, 255)),
                              )
                            ],
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Today',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForecastPage(
                                      forcast: _currentForecastModel!,
                                    )));
                      },
                      child: const Text(
                        '5 Days >',
                        style: TextStyle(
                            color: Color.fromARGB(115, 255, 255, 255),
                            fontSize: 16),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return Center(
                              child: DayWeatherCard(
                                  temperature:
                                      '${_currentForecastModel![index].temperature!.celsius!.toInt()}°',
                                  time: _currentForecastModel![index].date!,
                                  description: _currentForecastModel![index]
                                      .weatherDescription!),
                            );
                          }),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ]),
      backgroundColor: const Color.fromARGB(255, 1, 12, 29),
    );
  }
}
