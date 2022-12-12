import 'package:flutter/material.dart';

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
