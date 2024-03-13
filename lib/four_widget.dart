import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/form_field_controller.dart';


import 'four_model.dart';
export 'four_model.dart';





class FourWidget extends StatefulWidget {
  const FourWidget({super.key});

  @override
  State<FourWidget> createState() => _FourWidgetState();
}

class _FourWidgetState extends State<FourWidget> with TickerProviderStateMixin {
  late FourModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 2000.ms,
          duration: 2000.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 4000.ms,
          duration: 2000.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'checkboxGroupOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 4000.ms,
          duration: 2000.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FourModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(-0.03, -0.94),
                  child: Text(
                    'ECOSISTEMA',
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFFDA9D05),
                          fontSize: 45,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.85, -0.33),
                  child: Container(
                    width: 60,
                    height: 60,
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
                Align(
                  alignment: AlignmentDirectional(-0.25, -0.17),
                  child: Text(
                    '¿Qué te gustaría trabajar?',
                    style: FlutterFlowTheme.of(context).titleMedium,
                  ).animateOnPageLoad(
                      animationsMap['textOnPageLoadAnimation']!),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.01, 0.78),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('PERFIL');
                    },
                    text: 'ENVIAR',
                    options: FFButtonOptions(
                      height: 40,
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                              ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['buttonOnPageLoadAnimation']!),
                ),
                                  Align(
                  alignment: AlignmentDirectional(0, 0.11),
                  child: FlutterFlowCheckboxGroup(
                    options: ['ALIMENTACION', 'MENTALIDAD', 'ENTRENAMIENTO'],
                    onChanged: (val) {
                      setState(() {
                        _model.checkboxGroupValues = val;
                      });
                    },
                    activeColor: FlutterFlowTheme.of(context).secondary,
                    checkColor: FlutterFlowTheme.of(context).info,
                    checkboxBorderColor: FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleMedium,
                    checkboxBorderRadius: BorderRadius.circular(24),
                  ).animateOnPageLoad(
                      animationsMap['checkboxGroupOnPageLoadAnimation']!,
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
