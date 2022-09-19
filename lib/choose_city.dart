// ignore_for_file: prefer_const_constructors

import 'package:fluthear/widgets/search_field.dart';
import 'package:flutter/material.dart';

class ChooseCityPage extends StatefulWidget {
  const ChooseCityPage({Key? key}) : super(key: key);

  @override
  State<ChooseCityPage> createState() => _ChooseCityPageState();
}

class _ChooseCityPageState extends State<ChooseCityPage> {
  @override
  Widget build(BuildContext context) {
    var searchText = TextEditingController();
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 1, 12, 29),
        child: Container(
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
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 20, bottom: 15),
                  child: SearchFieldWidget()),
              Container(
                height: MediaQuery.of(context).size.height / 1.75,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 25,
                    itemBuilder: ((context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(4),
                        height: MediaQuery.of(context).size.height / 8,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(80, 255, 255, 255),
                                width: 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  'Mashhad',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text('Iran , Islamic Republic of',
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Color.fromARGB(30, 255, 255, 255)),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: IconButton(
                                    icon: Icon(
                                      Icons.done,
                                      size: 26,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {}),
                              ),
                            )
                          ],
                        ),
                      );
                    })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
