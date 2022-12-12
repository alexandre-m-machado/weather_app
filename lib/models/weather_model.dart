/*
{
  "coord": {
    "lon": 10.99,
    "lat": 44.34
  },
  "weather": [
    {
      "id": 501,
      "main": "Rain",
      "description": "moderate rain",
      "icon": "10d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 298.48,
    "feels_like": 298.74,
    "temp_min": 297.56,
    "temp_max": 300.05,
    "pressure": 1015,
    "humidity": 64,
    "sea_level": 1015,
    "grnd_level": 933
  },
  "visibility": 10000,
  "wind": {
    "speed": 0.62,
    "deg": 349,
    "gust": 1.18
  },
  "rain": {
    "1h": 3.16
  },
  "clouds": {
    "all": 100
  },
  "dt": 1661870592,
  "sys": {
    "type": 2,
    "id": 2075663,
    "country": "IT",
    "sunrise": 1661834187,
    "sunset": 1661882248
  },

  "name": "Zocca",

}             

*/

import 'package:flutter/cupertino.dart';

class Weather {
  final String weatherDisc;
  final String icon;

  Weather({required this.weatherDisc, required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    final weatherDisc = json['description'];
    final icon = json['icon'];
    return Weather(weatherDisc: weatherDisc, icon: icon);
  }
}

class Temperature {
  final double temperature;

  Temperature({required this.temperature});

  factory Temperature.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return Temperature(temperature: temperature);
  }
}

class WeatherGet {
  final String city;
  final Temperature tempInfo;
  final Weather weatherInfo;

  WeatherGet({
    required this.city,
    required this.tempInfo,
    required this.weatherInfo,
  });

  factory WeatherGet.fromJson(Map<String, dynamic> json) {
    final city = json['name'];

    final tempJson = json['main'];
    final tempInfo = Temperature.fromJson(tempJson);

    final weatherJson = json['weather'][0];
    final weatherInfo = Weather.fromJson(weatherJson);
    return WeatherGet(
      city: city,
      tempInfo: tempInfo,
      weatherInfo: weatherInfo,
    );
  }
}
