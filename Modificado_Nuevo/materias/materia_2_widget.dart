import 'package:flutter/material.dart';
import 'package:pomodoro/pomodoro/pomodoro_widget.dart';

class Materia2Widget extends StatelessWidget {
  const Materia2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progra Avanzada'),
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
      body: const Center(
        child: Text(
          'Contenido de la materia Progra Avanzada',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
