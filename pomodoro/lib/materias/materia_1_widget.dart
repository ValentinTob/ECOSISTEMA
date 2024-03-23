import 'package:flutter/material.dart';
import 'package:pomodoro/pomodoro/pomodoro_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class Materia1Widget extends StatelessWidget {
  const Materia1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fisica II'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          SizedBox(
            width: 50, // Ancho fijo del contenedor que contiene el icono
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PomodoroWidget()),
                );
              },
              icon: const Icon(Icons.emoji_food_beverage,
                  size: 30, color: Colors.red), // Reloj rojo
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context); // Vuelve a la pantalla anterior
            },
            icon:
                const Icon(Icons.home, color: Colors.purple), // Casita violeta
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Contenido de la materia Física',
              style: TextStyle(fontSize: 24),
            ),
          ),
          GestureDetector(
            onTap: () {
              const String notionUrl =
                  'https://www.notion.so/F-sica-2-6c291d8320ac4e38abac5f31bec6c650';
              // ignore: deprecated_member_use
              launch(notionUrl);
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                'images/notion.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
