import 'package:flutter/material.dart';
import 'package:flutter_application_1/perfil/perfil_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      routes: {
        '/perfil': (context) => PerfilWidget(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/perfil'); // Corregido aquí
          },
          child: Text('Ir a Perfil'),
        ),
      ),
    );
  }
}
