import 'package:EcosistemaPersonal/three_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:go_router/go_router.dart' show GoRouterHelper;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'two_model.dart';
export 'two_model.dart';

class TwoWidget extends StatefulWidget {
  const TwoWidget({super.key});

  @override
  State<TwoWidget> createState() => _TwoWidgetState();
}

class _TwoWidgetState extends State<TwoWidget> with TickerProviderStateMixin {
  late TwoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();


  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 1000.ms,
          begin: Offset(0, 50),
          end: Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 2000.ms,
          begin: 1,
          end: 0,
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0,
          end: 1,
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 2000.ms,
          begin: 1,
          end: 0,
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 1000.ms,
          begin: Offset(0, -25),
          end: Offset(0, 0),
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 2500.ms,
          duration: 2500.ms,
          begin: Offset(0, 0),
          end: Offset(0, -300),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 3000.ms,
          duration: 1000.ms,
          begin: Offset(1, 1),
          end: Offset(1.2, 1.2),
        ),
      ],
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 5000.ms,
          duration: 3000.ms,
          begin: 0,
          end: 1,
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 8500.ms,
          duration: 500.ms,
          begin: 1,
          end: 0,
        ),
      ],
    ),
    'circleImageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 5000.ms,
          duration: 1000.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'textOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 8500.ms,
          duration: 3000.ms,
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
          delay: 14500.ms,
          duration: 1000.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TwoModel());
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
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(-0.07, -0.24),
                child: Text(
                  'BIENVENIDO',
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Outfit',
                        color: FlutterFlowTheme.of(context).error,
                      ),
                ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation1']!),
              ),
              Align(
                alignment: AlignmentDirectional(-0.04, -0.1),
                child: Text(
                  'A TU PROPIO',
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Outfit',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation2']!),
              ),
              Align(
                alignment: AlignmentDirectional(-0.01, 0.03),
                child: Text(
                  'ECOSISTEMA',
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFFDA9D05),
                      ),
                ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation3']!),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.15),
                child: Text(
                  'Hola!\nSeré tu asistente en este proceso de crecimiento!',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleMedium,
                ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation4']!),
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
                ).animateOnPageLoad(
                    animationsMap['circleImageOnPageLoadAnimation']!),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.12),
                child: Text(
                  'Me llamo ECOSISTEMA y soy una Inteligencia Artificial especializada que te guiara  en este camino.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleMedium,
                ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation5']!),
              ),
              Align(
                alignment: AlignmentDirectional(0.01, 0.08),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      '/THREE',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 1000),
                        ),
                      },
                    );
                  },
                  text: 'ESTOY LISTO/A!',
                  options: FFButtonOptions(
                    height: 40,
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
            ],
          ),
        ),
      ),
    );
  }
}
