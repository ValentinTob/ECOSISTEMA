// ignore_for_file: avoid_print

import 'package:flutter_application_1/models/usuarios_model.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DbHelper {
  late Database _database;

  // Constructor asíncrono
  DbHelper() {
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    try {
      _database = await _openDatabase();
    } catch (e) {
      // Manejar la excepción, por ejemplo, imprimir un mensaje de error
      print('Error al abrir la base de datos: $e');
    }
  }

  Future<Database> get database async {
    // Esperar a que la base de datos esté inicializada
    await _initializeDatabase();
    return _database;
  }

  Future<Database> _openDatabase() async {
    try {
      // Abrir la base de datos y crear la tabla si no existe
      return await openDatabase(
        join(await getDatabasesPath(), 'ecosistema.db'),
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE usuarios (id INTEGER PRIMARY KEY, nombre TEXT, edad INT)",
          );
        },
        version: 1,
      );
    } catch (e) {
      // Capturar cualquier excepción y mostrar el mensaje de error
      print('Error al abrir la base de datos: $e');
      rethrow; // Reenviar la excepción para que sea manejada en un nivel superior si es necesario
    }
  }

  Future<List<Usuario>> getUsuariosQry() async {
    // Obtener la base de datos
    Database db = await database;
    // Realizar la consulta y mapear los resultados
    final List<Map<String, dynamic>> usuariosMap = await db.query("usuarios");
    return List.generate(
      usuariosMap.length,
      (i) => Usuario(
        edad: usuariosMap[i]['edad'],
        id: usuariosMap[i]["id"],
        nombre: usuariosMap[i]["nombre"],
      ),
    );
  }

  Future<void> agregarUsuario(String nombre, int edad) async {
    // Obtener la base de datos
    final db = await database;
    // Insertar el usuario en la base de datos
    await db.insert(
      'usuarios',
      {'nombre': nombre, 'edad': edad},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> mostrar() async {
    // Obtener la base de datos
    final db = await database;
    // Realizar la consulta y mostrar los resultados
    final data = await db.query('usuarios');
    print(data);
  }

  Future<void> borrarTodo() async {
    // Obtener la base de datos
    final db = await database;
    // Borrar todos los usuarios de la base de datos
    await db.delete('usuarios');
  }
}
