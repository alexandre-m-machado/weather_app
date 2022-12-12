import 'package:flutter/material.dart';
import 'package:weather_app/data/services.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  final _city = TextEditingController();

  final _service = Services();

  WeatherGet? _response;

  void _search() async {
    final response = await _service.getWeather(_city.text);
    setState(() => _response = response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          if (_response != null)
            Column(
              children: [
                Text(
                  '${_response!.tempInfo.temperature}°',
                  style: const TextStyle(fontSize: 60),
                ),
                Text(_response!.weatherInfo.weatherDisc)
              ],
            ),
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
    );
  }
}
