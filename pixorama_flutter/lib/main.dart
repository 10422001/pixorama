import 'package:pixorama_client/pixorama_client.dart';
import 'package:flutter/material.dart';
import 'package:pixorama_flutter/src/pixorama/pixorama.dart';

var client = Client('http://localhost:8080/');

void main() {
  runApp(const PixoramaApp());
}

class PixoramaApp extends StatelessWidget {
  const PixoramaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixorama',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Pixorama(),
    );
  }
}