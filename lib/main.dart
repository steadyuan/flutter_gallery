import 'package:flutter/material.dart';
import 'package:flutter_gallery/route/home.dart';
import 'package:flutter_gallery/route/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      onGenerateRoute: onGenerateRoute,
      onUnknownRoute: onUnknownRoute,
      home: const HomeScreen(),
    );
  }
}
