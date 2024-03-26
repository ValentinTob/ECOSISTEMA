import 'package:flutter/material.dart';


class PuertaModel extends ChangeNotifier {
  final unfocusNode = FocusNode();

  @override
  void dispose() {
    unfocusNode.dispose();
    super.dispose();
  }
}
