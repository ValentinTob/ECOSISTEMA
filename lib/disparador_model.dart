import 'package:flutter/material.dart';







class DisparadorModel extends ChangeNotifier {
  final unfocusNode = FocusNode();


  @override
  void dispose() {
    unfocusNode.dispose();
    super.dispose();
  }
}



DisparadorModel createModel(BuildContext context) {
  return DisparadorModel();
}
