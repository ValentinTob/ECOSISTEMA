

import 'package:flutter/material.dart';




class BienvenidaModel {
  late FocusNode unfocusNode;

  BienvenidaModel() {
    unfocusNode = FocusNode();
  }

  void dispose() {
    unfocusNode.dispose();
  }
}