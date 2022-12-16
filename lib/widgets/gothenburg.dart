import 'package:flutter/material.dart';
import 'package:weather_app/data/services.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/navegator.dart';

class GothenburgWidget extends StatefulWidget {
  const GothenburgWidget({super.key});

  @override
  State<GothenburgWidget> createState() => _GotherburgWidgetState();
}

class _GotherburgWidgetState extends State<GothenburgWidget> {
  final _service = Services();
  final _city = 'Gothenburg';
  bool _isVisible = true;

  WeatherGet? _response;

  void _search() async {
    final response = await _service.getWeather(_city);
    setState(() => _response = response);
    setState(() => _isVisible = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 191, 214, 222),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(height: 20),
          const Align(
            alignment: AlignmentDirectional.topEnd,
            child: Navegator(),
          ),
          Visibility(
            visible: _isVisible,
            child: ElevatedButton(
              onPressed: () {
                _search();
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15.0),
                  fixedSize: const Size(150, 50),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  elevation: 15,
                  shadowColor: Colors.lightBlue,
                  side: const BorderSide(color: Colors.black, width: 2),
                  shape: const StadiumBorder()),
              child: const Text('Show'),
            ),
          ),
          if (_response != null)
            Column(
              children: [
                Text(
                  _city,
                  style: const TextStyle(fontSize: 40),
                ),
                Image.network(_response!.iconUrl),
                Text(_response!.weatherInfo.weatherDisc),
                Text(
                  '${_response!.tempInfo.temperature}°',
                  style: const TextStyle(fontSize: 60),
                ),
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
                    const SizedBox(
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
        ],
      )),
    );
  }
}
