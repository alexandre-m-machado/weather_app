import 'package:flutter/material.dart';
import 'package:weather_app/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _city = TextEditingController();
  final _Service = Services();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                  width: 150,
                  child: TextField(
                    controller: _city,
                    decoration: const InputDecoration(labelText: 'City'),
                    textAlign: TextAlign.center,
                  ))),
          const Padding(
            padding: EdgeInsets.only(top: 25),
          ),
          ElevatedButton(
            onPressed: _search,
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15.0),
                fixedSize: const Size(150, 50),
                foregroundColor: Colors.black,
                backgroundColor: Colors.lightBlue,
                elevation: 15,
                shadowColor: Colors.lightBlue,
                side: const BorderSide(color: Colors.black, width: 2),
                shape: const StadiumBorder()),
            child: const Text('Search'),
          )
        ],
      )),
    ));
  }

  void _search() {
    _Service.getWeather(_city.text);
  }
}
