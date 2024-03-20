// ignore_for_file: avoid_print

import 'package:flutter_application_1/models/usuarios_model.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DbHelper {
  late Database _database;

  DbHelper() {
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    databaseFactory = databaseFactoryFfi;
    _database = await _openDatabase();
  }

  Future<Database> get database async {
    // Verificar si la base de datos está abierta y devolverla
    if (_database.isOpen) {
      return _database;
    }
    // Si no está abierta, abrir la base de datos y devolverla
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
