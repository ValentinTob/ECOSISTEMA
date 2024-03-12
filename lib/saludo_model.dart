import 'package:flutter/foundation.dart';

class SaludoModel {
  String? saludo;

  SaludoModel({this.saludo});

  void setSaludo(String nuevoSaludo) {
    saludo = nuevoSaludo;
  }
}
