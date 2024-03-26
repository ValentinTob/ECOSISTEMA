import 'package:EcosistemaPersonal_1/bienvenida_widget.dart';
import 'package:flutter/material.dart';

class AnimacionEntradaWidget extends StatefulWidget {
  const AnimacionEntradaWidget({Key? key}) : super(key: key);

  @override
  State<AnimacionEntradaWidget> createState() => _AnimacionEntradaWidgetState();
}

class _AnimacionEntradaWidgetState extends State<AnimacionEntradaWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _startAnimation();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward();
  }

  void _startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 5500));
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const BienvenidaWidget(),
        transitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    key: scaffoldKey,
    backgroundColor: Colors.black,
    body: SafeArea(
      top: true,
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(-0.04, -0.1),
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Text(
                  'A TU PROPIO',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontSize: 43,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-0.07, -0.24),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Text(
                      'BIENVENIDO',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Colors.red,
                        fontSize: 43,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-0.03, 0.04),
            child: ScaleTransition(
              scale: _controller,
              child: Text(
                'ECOSISTEMA',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: const Color(0xFFDA9D05),
                  fontSize: 43,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}