// ignore_for_file: prefer_const_constructors

import 'package:fluthear/main_page.dart';
import 'package:fluthear/services/pref_service.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

import '../api/open_weather.dart';

class SearchFieldWidget extends StatefulWidget {
  const SearchFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  TextEditingController searchText = TextEditingController();
  PrefService prefService = PrefService();
  OpenWeather openWeather = OpenWeather();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width / 2.5,
      // padding: EdgeInsets.only(bottom: 7, left: 7, right: 7),
      decoration: BoxDecoration(
          border: Border.all(
              width: 2, color: Colors.white, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        controller: searchText,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 10),
            // ignore: unnecessary_const
            suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  size: 26,
                  color: Colors.white,
                ),
                onPressed: () async {
                  try {
                    await prefService
                        .setCache(searchText.text)
                        .whenComplete(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainPage()));
                    });
                  } on OpenWeatherAPIException {
                    var dialog = AlertDialog(
                      title: Text('Inavlid City.'),
                      content: Text('Please Double Check Your Spelling.'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MainPage()));
                            },
                            child: Text('OK'))
                      ],
                    );
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return dialog;
                        });
                  }
                }),
            border: InputBorder.none),
      ),
    );
  }
}
