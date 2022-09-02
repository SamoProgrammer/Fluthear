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
}
