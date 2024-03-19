import 'package:flutter/material.dart';
import 'package:flutter_application_1/db_helper.dart';
import 'package:flutter_application_1/helpers/usuario_helper.dart';
import 'package:flutter_application_1/models/usuarios_model.dart';

class Perfil1 extends StatefulWidget {
  const Perfil1({super.key, required this.dbHelper});

  final DbHelper dbHelper;

  @override
  _Perfil1State createState() => _Perfil1State();
}

class _Perfil1State extends State<Perfil1> {
  late UsuarioHelper _usuarioHelper;
  String _nombre = '';
  int _edad = 0;

  @override
  Future<void> initState() async {
    super.initState();
    _usuarioHelper = UsuarioHelper(await DbHelper.database);

    _cargarPerfil();
  }

  Future<void> _cargarPerfil() async {
    final usuarios = await _usuarioHelper.cargarUsuarios();
    final usuario1 = usuarios.firstWhere((usuario) => usuario.id == 1,
        orElse: () => Usuario(id: 0, nombre: '', edad: 0));
    setState(() {
      _nombre = usuario1.nombre;
      _edad = usuario1.edad;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre: $_nombre',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Edad: $_edad',
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
