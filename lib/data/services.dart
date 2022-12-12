import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class Services {
  Future<WeatherGet> getWeather(String city) async {
    final queryParameter = {
      'q': city,
      'appid': 'd73c4050be283cea7ff555ebafcb5fe9',
      'units': 'metric'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameter);

    final response = await http.get(uri);

    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherGet.fromJson(json);
  }
}
