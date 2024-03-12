import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'perfil_model.dart';

class PerfilWidget extends StatelessWidget {
  const PerfilWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/foto (1).jpg'),
              radius: 20, // Tamaño de la imagen
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nombre'),
              onChanged: (value) =>
                  Provider.of<PerfilModel>(context, listen: false)
                      .setNombre(value),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Edad'),
              keyboardType: TextInputType.number,
              onChanged: (value) =>
                  Provider.of<PerfilModel>(context, listen: false)
                      .setEdad(int.tryParse(value) ?? 0),
            ),
            const SizedBox(
                height:
                    16), // Añadimos un espacio entre los TextFormField y el botón
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/perfil_menu');
              },
              child: const Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
