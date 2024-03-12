import 'package:flutter/material.dart';

class PerfilModel extends ChangeNotifier {
  late String nombre;
  late int edad;

  void setNombre(String nombre) {
    this.nombre = nombre;
    notifyListeners();
  }

  void setEdad(int edad) {
    this.edad = edad;
    notifyListeners();
  }
}
