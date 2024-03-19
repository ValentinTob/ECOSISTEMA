import 'package:sqflite/sqflite.dart';
import 'package:flutter_application_1/models/usuarios_model.dart';

class UsuarioHelper {
  late Database _database;
  bool _isDatabaseInitialized = false;

  UsuarioHelper(Database database) {
    _database = database;
    _isDatabaseInitialized = true;
  }

  Future<List<Usuario>> cargarUsuarios() async {
    final List<Map<String, dynamic>> usuarios =
        await _database.query('usuarios');
    return usuarios.map((e) => Usuario.fromMap(e)).toList();
  }

  Future<Usuario?> obtenerUsuarioPorId(int id) async {
    final List<Map<String, dynamic>> usuarios = await _database.query(
      'usuarios',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (usuarios.isNotEmpty) {
      return Usuario.fromMap(usuarios.first);
    }
    return null;
  }

  Future<void> agregarUsuario(Usuario usuario) async {
    await _database.insert(
      'usuarios',
      usuario.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> borrarTodosUsuarios() async {
    await _database.delete('usuarios');
  }

  Future<bool> estaInicializada() async {
    return _isDatabaseInitialized;
  }
}
