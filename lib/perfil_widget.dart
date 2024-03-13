import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'perfil_model.dart';

class PerfilWidget extends StatefulWidget {
  final PerfilModel model;

  const PerfilWidget({Key? key, required this.model}) : super(key: key);

  @override
  _PerfilWidgetState createState() => _PerfilWidgetState();
}

class _PerfilWidgetState extends State<PerfilWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
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
    'textOnPageLoadAnimation2': AnimationInfo(
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
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: Duration.zero,
          duration: const Duration(milliseconds: 1000),
          begin: const Offset(0, -25),
          end: const Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    widget.model.initState(context);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/foto (1).jpg'),
              radius: 20,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: const AlignmentDirectional(0, 0.21),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                child: TextFormField(
                  controller: widget.model.textController1,
                  focusNode: widget.model.textFieldFocusNode1,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'NOMBRE',
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Changed text color to black
                  validator: widget.model.textController1Validator
                      .asValidator(context),
                ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation1']!),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0.21),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                child: TextFormField(
                  controller: widget.model.textController2,
                  focusNode: widget.model.textFieldFocusNode2,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Apellido',
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Changed text color to black
                  validator: widget.model.textController1Validator
                      .asValidator(context),
                ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation1']!),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/perfil_menu');
              },
              child: const Text('Continuar'),
            ),
            const SizedBox(
              height: 24,
            ),
            FadeTransition(
              opacity: _animation,
              child: Align(
                alignment: const AlignmentDirectional(0.25, -0.17),
                child: Text(
                  'Dime ¿Cuál es tu nombre y apellido?',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
