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
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: Colors.white,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    controller: searchText,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        // ignore: unnecessary_const
                        icon: const Icon(
                          Icons.search,
                          size: 26,
                          color: Colors.white,
                        ),
                        border: InputBorder.none),
                  ),
                ),
              ),
              //   Visibility(
              //       child: ListView.builder(
              //           itemCount: 5,
              //           itemBuilder: ((context, index) {
              //             return Padding(
              //               padding: const EdgeInsets.only(
              //                   right: 10, left: 10, top: 15, bottom: 15),
              //               child: Container(
              //                 height: MediaQuery.of(context).size.height / 5,
              //                 width: MediaQuery.of(context).size.width,
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: const [
              //                     Text(
              //                       'Mashhad',
              //                       style: TextStyle(color: Colors.white),
              //                     ),
              //                     Text('Iran , Islamic Republic of',
              //                         style: TextStyle(color: Colors.white))
              //                   ],
              //                 ),
              //               ),
              //             );
              //           })))
            ],
          ),
        ),
      ),
    );
  }
}
