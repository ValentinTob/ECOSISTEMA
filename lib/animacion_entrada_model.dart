
import 'package:flutter/material.dart';


class AnimacionEntradaModel extends ChangeNotifier {
  final unfocusNode = FocusNode();

  @override
  void dispose() {
    unfocusNode.dispose();
    super.dispose();
  }
}