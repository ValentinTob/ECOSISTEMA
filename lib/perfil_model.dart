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

  // Campos y métodos adicionales del segundo modelo
  final unfocusNode = FocusNode();
  late FocusNode textFieldFocusNode1;
  late TextEditingController textController1 = TextEditingController();
  late String? Function(BuildContext, String?) textController1Validator;
  late FocusNode textFieldFocusNode2;
  late TextEditingController textController2;
  late String? Function(BuildContext, String?) textController2Validator;

  void initState(BuildContext context) {
    textFieldFocusNode1 = FocusNode();
    textController1 = TextEditingController();
    textController1Validator = (BuildContext context, String? value) {
      if (value == null || value.isEmpty) {
        return 'Este campo es requerido';
      }
      return null;
    };

    textFieldFocusNode2 = FocusNode();
    textController2 = TextEditingController();
    textController2Validator = (BuildContext context, String? value) {
      if (value == null || value.isEmpty) {
        return 'Este campo es requerido';
      }
      return null;
    };
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1.dispose();
    textController1.dispose();

    textFieldFocusNode2.dispose();
    textController2.dispose();
  }
}
