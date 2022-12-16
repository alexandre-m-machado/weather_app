import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/widgets/weather.dart';

const List<String> list = <String>[
  'Stockholm',
  'Gothenburg',
  'Uppsala',
  'Lund'
];

class Navegator extends StatefulWidget {
  const Navegator({super.key});

  @override
  State<Navegator> createState() => _NavegatorState();
}

class _NavegatorState extends State<Navegator> {
  String dropDown = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      icon: const Icon(Icons.list),
      onChanged: (String? value) {
        setState(() => dropDown = value!);
        String page = value.toString();
        Navigator.pushNamed(context, page);
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
