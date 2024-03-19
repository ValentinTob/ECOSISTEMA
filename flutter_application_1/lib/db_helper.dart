import 'package:flutter_application_1/models/usuarios_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static late Database _database;

  static Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _openDatabase();
    return _database;
  }

  static Future<Database> _openDatabase() async {
    return openDatabase(join(await getDatabasesPath(), 'ecosistema.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE usuarios (id INTEGER PRIMARY KEY, nombre TEXT, edad INT)");
    }, version: 1);
  }

  static Future<List<Usuario>> getUsuariosQry() async {
    Database db = await database;
    final List<Map<String, dynamic>> usuariosMap = await db.query("usuarios");
    return List.generate(
        usuariosMap.length,
        (i) => Usuario(
            edad: usuariosMap[i]['edad'],
            id: usuariosMap[i]["id"],
            nombre: usuariosMap[i]["nombre"]));
  }

  static Future<void> agregarUsuario(String nombre, int edad) async {
    final db = await database;
    await db.insert(
      'usuarios',
      {'nombre': nombre, 'edad': edad},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> mostrar() async {
    final db = await database;
    final data = await db.query('usuarios');
    print(data);
  }

  static Future<void> borrarTodo() async {
    final db = await database;
    await db.delete('usuarios');
  }
}
