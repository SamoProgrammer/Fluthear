import 'package:fluthear/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FluthearApp());
}

class FluthearApp extends StatelessWidget {
  const FluthearApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Compose'),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}
