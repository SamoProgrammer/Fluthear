// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors

import 'dart:html';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 680,
        margin: EdgeInsets.only(left: 9, top: 9, right: 9),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Color.fromARGB(255, 19, 166, 254),
        ),
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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                            color: Color.fromARGB(255, 52, 185, 254)),
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        primary: Color.fromARGB(255, 19, 166, 254),
                        onPrimary: Color.fromARGB(255, 19, 166, 254),
                      ),
                      child: Icon(
                        Icons.workspaces_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 26,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text('Minsk',
                              style:
                                  TextStyle(fontSize: 26, color: Colors.white)),
                        ),
                      ],
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                            color: Color.fromARGB(255, 19, 166, 254)),
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(16),
                        primary: Color.fromARGB(255, 19, 166, 254),
                        onPrimary: Color.fromARGB(255, 19, 166, 254),
                      ),
                      child:
                          Icon(Icons.more_vert, color: Colors.white, size: 28),
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 70,
                  child: Visibility(
                      child: OutlinedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(5),
                      primary: Color.fromARGB(255, 19, 166, 254),
                      onPrimary: Color.fromARGB(255, 19, 166, 254),
                    ),
                    child: Center(
                      child: Text(
                        'Updating',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  )),
                ),
                SizedBox(
                  height: 250,
                  child: Container(
                      alignment: Alignment.topCenter,
                      height: 250,
                      child: Image.asset('assets/images/lightining_cloud.png')),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    height: 170,
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Text(
                          '21',
                          style: TextStyle(
                              fontSize: 130,
                              fontFamily: 'Vitro',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 0.75),
                        ),
                        Text(
                          'Thunderstorm',
                          style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        Text(
                          'Monday, 17 May',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 155, 200, 246)),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10,left: 10),
                  child: Container(
                    height: 1,
                    color: Color.fromARGB(100, 255, 255, 255),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 1, 12, 29),
    );
  }

  RoundsPressed() {}
}
