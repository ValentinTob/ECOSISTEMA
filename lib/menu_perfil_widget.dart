import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'perfil_model.dart';

class MenuPerfilWidget extends StatelessWidget {
  const MenuPerfilWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Perfil:',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Consumer<PerfilModel>(
            builder: (context, perfilModel, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nombre: ${perfilModel.nombre}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    'Edad: ${perfilModel.edad}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
