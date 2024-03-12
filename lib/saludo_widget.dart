import 'package:flutter/material.dart';
import 'saludo_model.dart';

class SaludoWidget extends StatefulWidget {
  const SaludoWidget({Key? key}) : super(key: key);

  @override
  _SaludoWidgetState createState() => _SaludoWidgetState();
}

class _SaludoWidgetState extends State<SaludoWidget> {
  final SaludoModel _model = SaludoModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saludo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¡Hola! ¿Cómo estás?',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _mostrarDialogo(context);
              },
              child: Text('Responder'),
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarDialogo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Responder al saludo'),
          content: TextField(
            onChanged: (value) {
              _model.setSaludo(value);
            },
            decoration: InputDecoration(
              hintText: 'Ingrese su respuesta',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Aquí se puede manejar la respuesta
                print('Respuesta: ${_model.saludo}');
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
