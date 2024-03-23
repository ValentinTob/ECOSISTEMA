import 'package:flutter/material.dart';
import 'package:pomodoro/MyHomePage_widget.dart';
import 'package:pomodoro/materias/materia_1_widget.dart';

import 'materias/materia_2_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 116, 24, 39)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Inicio'),
        '/materia_1': (context) => const Materia1Widget(),
        '/materia_2': (context) =>
            const Materia2Widget(), /*
        '/materia_3': (context) => const Materia3Widget(),
        '/materia_4': (context) => const Materia4Widget(),
        '/materia_5': (context) => const Materia5Widget(),*/
      },
    );
  }
}
