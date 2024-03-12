import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'one_widget.dart' show OneWidget;
import 'package:flutter/material.dart';

class OneModel extends FlutterFlowModel<OneWidget> {
  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
