import 'package:http/http.dart' as http;

class Services {
  void getWeather(String city) async {
    final queryParameter = {
      'k': city,
      'AppId': 'd73c4050be283cea7ff555ebafcb5fe9'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameter);

    final response = await http.get(uri);

    print(response.body);
  }
}
