import 'package:shared_preferences/shared_preferences.dart';
class PrefService {
  Future setCache(String defaultCity) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("default_city", defaultCity);
  }

  Future readCache() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var cache = preferences.getString("default_city");
    return cache;
  }

  Future removeCache() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("default_city");
  }
   Future checkCache() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.containsKey("default_city");
  }
}