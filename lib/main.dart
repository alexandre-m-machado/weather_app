import 'package:flutter/material.dart';
import 'package:weather_app/widgets/Uppsala.dart';
import 'package:weather_app/widgets/gothenburg.dart';
import 'package:weather_app/widgets/lund.dart';
import 'package:weather_app/widgets/stockholm.dart';
import 'package:weather_app/widgets/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const WeatherWidget(),
        'Stockholm': (context) => const StockholmWidget(),
        'Gothenburg': (context) => const GothenburgWidget(),
        'Uppsala': (context) => const UppsalaWidget(),
        'Lund': (context) => const LundWidget(),
      },
    );
  }
}
