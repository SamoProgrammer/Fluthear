import 'package:http/http.dart' as http;
import 'constants.dart';
import 'models/current_weather_model.dart';

class ApiService {
  Future<CurrentWeatherModel?> getCurrentWeather() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl +
          ApiConstants.currentWeatherUrl +
          '?city=Tehran&country=IR&key='+ApiConstants.apiKey);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        CurrentWeatherModel _model = currentWeatherModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
