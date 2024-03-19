import 'package:flutter/material.dart';
import 'package:flutter_application_1/db_helper.dart';
import 'package:flutter_application_1/perfil/perfil_1.dart';

class PerfilWidget extends StatefulWidget {
  const PerfilWidget({super.key});

  @override
  _PerfilWidgetState createState() => _PerfilWidgetState();
}

class _PerfilWidgetState extends State<PerfilWidget> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();
  String? _selectedGenero;

  late DbHelper _dbHelper; // Instancia de DbHelper

  @override
  void initState() {
    super.initState();
    _dbHelper = DbHelper(); // Inicializar DbHelper
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: _edadController,
              decoration: const InputDecoration(labelText: 'Edad'),
              keyboardType: TextInputType.number,
            ),
            DropdownButtonFormField<String>(
              value: _selectedGenero,
              onChanged: (newValue) {
                setState(() {
                  _selectedGenero = newValue;
                });
              },
              items: <String>['Hombre', 'Mujer', 'No binario']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(labelText: 'Género'),
            ),
            ElevatedButton(
              onPressed: () async {
                final String nombre = _nombreController.text;
                final int edad = int.tryParse(_edadController.text) ?? 0;
                await DbHelper.agregarUsuario(nombre, edad);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => Perfil1(
                        dbHelper:
                            _dbHelper))); // Pasar la instancia de DbHelper a Perfil1
              },
              child: const Text('Guardar'),
            ),
            ElevatedButton(
              onPressed: () async {
                DbHelper.mostrar();
              },
              child: const Text('Mostrar'),
            )
          ],
        ),
      ),
    );
  }
}
