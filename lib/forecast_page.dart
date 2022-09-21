import 'package:fluthear/api/open_weather.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class ForecastPage extends StatefulWidget {
  final List<Weather> forcast;
  const ForecastPage({Key? key, required this.forcast}) : super(key: key);

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 12, 29),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back,color: Colors.white,size: 26,)),
                Text(
                  '5 Day Forecast',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                Container(
                  // color: Colors.white,
                  // height: 1,
                  // width: MediaQuery.of(context).size.width / 3,
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 80,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: widget.forcast.length,
              itemBuilder: ((context, index) => Container(
                    height: MediaQuery.of(context).size.height / 8,
                    margin: const EdgeInsets.all(10),
                    padding: EdgeInsets.all(7),
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
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '${DateFormat('EEEE').format(widget.forcast[index].date!)}  ${widget.forcast[index].date!.hour}:${widget.forcast[index].date!.minute}',
                              style: TextStyle(
                                  color: Color.fromARGB(153, 255, 255, 255))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.forcast[index].weatherDescription!,
                                  style: TextStyle(color: Colors.white)),
                              Image.asset(
                                OpenWeather().getImageByDescription(
                                    widget.forcast[index].weatherDescription!,
                                    widget.forcast[index].date!.hour),
                                width: 50,
                              ),
                            ],
                          ),
                          Text(
                            '${widget.forcast[index].temperature!.celsius!.toInt()}°',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          )
                        ],
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
