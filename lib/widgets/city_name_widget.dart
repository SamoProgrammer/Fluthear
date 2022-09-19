import 'package:fluthear/services/pref_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CityNameWidget extends StatefulWidget {
  const CityNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CityNameWidget> createState() => _CityNameWidgetState();
}

class _CityNameWidgetState extends State<CityNameWidget> {
  PrefService prefService = PrefService();
  String cityName = '';
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    var temp = await prefService.readCache();
    setState(() {
      cityName = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(cityName,
          style: const TextStyle(fontSize: 26, color: Colors.white)),
    );
  }
}
