import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal,
        ),
        canvasColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 90
        ),
        textTheme: TextTheme(
          headlineMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          titleLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black),
          headlineLarge: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
