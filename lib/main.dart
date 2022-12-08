import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                  width: 150,
                  child: TextField(
                    controller: null,
                    decoration: InputDecoration(labelText: 'City'),
                    textAlign: TextAlign.center,
                  ))),
          const Padding(
            padding: EdgeInsets.only(top: 25),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15.0),
                fixedSize: Size(150, 50),
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
}
