import 'package:flutter/material.dart';





class Vida_1_Model extends ChangeNotifier {
  final unfocusNode = FocusNode();

  @override
  void dispose() {
    unfocusNode.dispose();
    super.dispose();
  }

}



Vida_1_Model createModel(BuildContext context) {
  return Vida_1_Model();
}



