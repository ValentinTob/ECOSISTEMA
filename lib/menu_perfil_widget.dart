import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:provider/provider.dart';
import 'perfil_model.dart';

class MenuPerfilWidget extends StatefulWidget {
  const MenuPerfilWidget({Key? key}) : super(key: key);

  @override
  _MenuPerfilWidgetState createState() => _MenuPerfilWidgetState();
}

class _MenuPerfilWidgetState extends State<MenuPerfilWidget> {
  late List<String> _checkboxGroupValues = [];

  @override
  Widget build(BuildContext context) {
    final animationsMap = {
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: Duration.zero,
            duration: const Duration(milliseconds: 1000),
            begin: 0,
            end: 1,
          ),
        ],
      ),
      'checkboxGroupOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: Duration.zero,
            duration: const Duration(milliseconds: 1000),
            begin: const Offset(0, 50),
            end: const Offset(0, 0),
          ),
        ],
      ),
    };

    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: 200, // Modifica el ancho según tus necesidades
          height: 200, // Modifica la altura según tus necesidades
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/images/foto (1).jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
