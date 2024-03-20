import 'package:flutter_application_1/models/usuarios_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  late Database _database;

  DbHelper() {
    _openDatabase().then((db) {
      _database = db;
    });
  }

  Future<Database> get database async {
    if (_database.isOpen) {
      return _database;
    }
    _database = await _openDatabase();
    return _database;
  }

  Future<Database> _openDatabase() async {
    return openDatabase(join(await getDatabasesPath(), 'ecosistema.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE usuarios (id INTEGER PRIMARY KEY, nombre TEXT, edad INT)");
    }, version: 1);
  }

  Future<List<Usuario>> getUsuariosQry() async {
    Database db = await database;
    final List<Map<String, dynamic>> usuariosMap = await db.query("usuarios");
    return List.generate(
        usuariosMap.length,
        (i) => Usuario(
            edad: usuariosMap[i]['edad'],
            id: usuariosMap[i]["id"],
            nombre: usuariosMap[i]["nombre"]));
  }

  Future<void> agregarUsuario(String nombre, int edad) async {
    final db = await database;
    await db.insert(
      'usuarios',
      {'nombre': nombre, 'edad': edad},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> mostrar() async {
    final db = await database;
    final data = await db.query('usuarios');
    print(data);
  }

  Future<void> borrarTodo() async {
    final db = await database;
    await db.delete('usuarios');
  }
}
