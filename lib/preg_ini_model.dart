import 'package:flutter/material.dart';



class PreguntasInicialesModel {
  late FocusNode unfocusNode;
  late FocusNode textFieldFocusNode;
  late TextEditingController textController;
  late String? Function(String?) textControllerValidator;

  PreguntasInicialesModel() {
    unfocusNode = FocusNode();
    textFieldFocusNode = FocusNode();
    textController = TextEditingController();
    textControllerValidator = (value) {
      if (value == null || value.isEmpty) {
        return 'Ingrese un nombre válido';
      }
      return null; // Devuelve null si la validación es exitosa
    };
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode.dispose();
    textController.dispose();
  }
}