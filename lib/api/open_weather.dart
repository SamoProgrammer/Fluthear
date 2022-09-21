import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class OpenWeather {
  WeatherFactory factory = WeatherFactory('57c3f603f20b30260613e2bd2019a57c',
      language: Language.ENGLISH);
  Future<Weather> getCurrentOpenWeather(String cityName) async {
    Weather currentWeather = await factory.currentWeatherByCityName(cityName);
    return currentWeather;
  }

  Future<List<Weather>> getForecastByCity(String cityName) async {
    List<Weather> forecast = await factory.fiveDayForecastByCityName(cityName);
    return forecast;
  }

  String getImageByDescription(String description, int hour) {
    var temp = description.toLowerCase();
    var addressPrefix = 'assets/images/';
    String image = '';
    var dayConditions = {
      'rain': 'rainy_cloud.png',
      'part': 'partly_cloud.png',
      'snow': 'snow_cloud.png',
      'light': 'lightining_cloud.png',
      'cloud': 'cloud.png',
    };
    var nightConditions = {
      'rain': 'rainy_moon.png',
      'part': 'cloud_moon.png',
      'light': 'lightining_cloud.png',
      'snow': 'snow_moon.png',
      'cloud': 'cloud_moon.png',
    };
    if (hour <= 4 || hour > 17) {
      for (var i in nightConditions.entries) {
        if (temp.contains(i.key)) {
          image = addressPrefix + i.value;
        } else {
          image = '${addressPrefix}star_moon.png';
        }
      }
    } else {
      for (var i in dayConditions.entries) {
        if (temp.contains(i.key)) {
          image = addressPrefix + i.value;
        } else {
          image = '${addressPrefix}sun.png';
        }
      }
    }
    return image;
  }
}
