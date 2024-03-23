// ignore_for_file: file_names

import 'dart:ui';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Materias',
              style: TextStyle(fontSize: 30), // Aumentar tamaño del texto
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.8, // Ancho del 80% de la pantalla
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10), // Márgenes
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Bordes redondeados
                  image: const DecorationImage(
                    image: AssetImage(
                        'images/magnetismo.png'), // Ruta de la imagen
                    fit: BoxFit.cover, // Ajuste de la imagen
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Bordes redondeados
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 1, sigmaY: 1), // Desenfoque gaussiano
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/materia_1');
                      },
                      // ignore: sort_child_properties_last
                      child: const Text(
                        'Ir a Física II',
                        style: TextStyle(
                          fontSize: 24, // Aumentar tamaño del texto
                          color: Colors.black, // Color del texto
                          fontWeight: FontWeight.bold, // Fuente negrita
                          shadows: [
                            Shadow(
                              color: Colors.white, // Color del borde
                              blurRadius: 3, // Grosor del borde
                            ),
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.transparent, // Fondo transparente
                        elevation: 0, // Sin sombra
                        padding:
                            const EdgeInsets.symmetric(vertical: 20), // Relleno
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.8, // Ancho del 80% de la pantalla
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10), // Márgenes
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Bordes redondeados
                  image: const DecorationImage(
                    image: AssetImage(
                        'images/prograAvanzada.png'), // Ruta de la imagen
                    fit: BoxFit.cover, // Ajuste de la imagen
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Bordes redondeados
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 1, sigmaY: 1), // Desenfoque gaussiano
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/materia_2');
                      },
                      // ignore: sort_child_properties_last
                      child: const Text(
                        'Ir Progra Avanzada',
                        style: TextStyle(
                          fontSize: 24, // Aumentar tamaño del texto
                          color: Colors.black, // Color del texto
                          fontWeight: FontWeight.bold, // Fuente negrita
                          shadows: [
                            Shadow(
                              color: Colors.white, // Color del borde
                              blurRadius: 3, // Grosor del borde
                            ),
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.transparent, // Fondo transparente
                        elevation: 0, // Sin sombra
                        padding:
                            const EdgeInsets.symmetric(vertical: 20), // Relleno
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
