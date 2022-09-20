import 'package:shared_preferences/shared_preferences.dart';
class PrefService {
  Future setCache(String default_city) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString("default_city", default_city);
  }

  Future readCache() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var cache = _preferences.getString("default_city");
    return cache;
  }

  Future removeCache() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.remove("default_city");
  }
   Future checkCache() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return _preferences.containsKey("default_city");
  }
}