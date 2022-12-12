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
      backgroundColor: const Color.fromARGB(255, 191, 214, 222),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          if (_response != null)
            Column(
              children: [
                const SizedBox(height: 15),
                Text(
                  '${_response!.city}°',
                  style: const TextStyle(fontSize: 40),
                ),
                Image.network(_response!.iconUrl),
                Text(_response!.weatherInfo.weatherDisc),
                const SizedBox(height: 20),
                Text(
                  '${_response!.tempInfo.temperature}°',
                  style: const TextStyle(fontSize: 60),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${_response!.tempInfo.tempMin}°',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const Text(
                      'Min',
                      style: TextStyle(
                          fontSize: 15, color: Color.fromARGB(223, 94, 86, 86)),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      '${_response!.tempInfo.tempMax}°',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'Max',
                      style: TextStyle(
                          fontSize: 15, color: Color.fromARGB(223, 94, 86, 86)),
                    ),
                  ],
                ),
              ],
            ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                  width: 150,
                  child: TextField(
                    controller: _city,
                    decoration: const InputDecoration(
                      labelText: 'City',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.black),
                      ),
                    ),
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
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
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
