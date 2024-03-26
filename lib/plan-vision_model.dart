import 'package:flutter/material.dart';




class PlanVisionModel extends ChangeNotifier {
  final unfocusNode = FocusNode();


  @override
  void dispose() {
    unfocusNode.dispose();
    super.dispose();
  }
}



PlanVisionModel createModel(BuildContext context) {
  return PlanVisionModel();
}

