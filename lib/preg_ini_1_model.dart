import 'package:flutter/material.dart';



import 'preg_ini_1_widget.dart' show PreguntasIniciales1Widget;


class PreguntasIniciales1Model extends ChangeNotifier {
  final unfocusNode = FocusNode();
  
  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues;
  bool initialized = false;

  @override
  void dispose() {
    unfocusNode.dispose();
    super.dispose();
  }

  void setCheckboxGroupValues(List<String> values) {
    checkboxGroupValues = values;
    notifyListeners();
  }
}

PreguntasIniciales1Model createModel(BuildContext context) {
  return PreguntasIniciales1Model();
}