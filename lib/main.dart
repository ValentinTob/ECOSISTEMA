import 'package:flutter/material.dart';
import 'one_widget.dart';
import 'two_widget.dart';
import 'three_widget.dart';
import 'four_widget.dart';
import 'perfil_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecosistema Personal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => OneWidget(),
        '/TWO': (context) => TwoWidget(), // Agrega una barra inclinada al inicio del nombre de la ruta
        '/THREE': (context) => ThreeWidget(), // Agrega una barra inclinada al inicio del nombre de la ruta
        '/FOUR': (context) => FourWidget(), // Agrega una barra inclinada al inicio del nombre de la ruta
        '/PERFIL': (context) => PerfilWidget(), // Agrega una barra inclinada al inicio del nombre de la ruta
      },
    );
  }
}
