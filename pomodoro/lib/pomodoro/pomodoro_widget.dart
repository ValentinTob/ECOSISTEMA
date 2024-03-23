// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:ui';

class PomodoroWidget extends StatefulWidget {
  const PomodoroWidget({super.key});

  @override
  _PomodoroWidgetState createState() => _PomodoroWidgetState();
}

class _PomodoroWidgetState extends State<PomodoroWidget>
    with TickerProviderStateMixin {
  String _selectedOption = 'Pomodoro';
  Duration _timerDuration = const Duration(minutes: 1);
  late Timer _timer;
  bool _isRunning = false;
  bool _showClockImage = false;

  late AnimationController _animationController;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration.zero, () {});
    _resetTimer();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _rotateAnimation =
        Tween(begin: 0.0, end: 360.0).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timerDuration.inSeconds > 0) {
          _timerDuration -= const Duration(seconds: 1);
        } else {
          _isRunning = false;
          _timer.cancel();
          _showClockImage = true;
          _animationController.repeat();
        }
      });
    });
  }

  void _stopTimer() {
    setState(() {
      _isRunning = false;
    });
    _timer.cancel();
  }

  void _resetTimer() {
    setState(() {
      _isRunning = false;
      if (_selectedOption == 'Pomodoro') {
        _timerDuration = const Duration(minutes: 25);
      } else if (_selectedOption == 'Short Break') {
        _timerDuration = const Duration(minutes: 5);
      } else if (_selectedOption == 'Long Break') {
        _timerDuration = const Duration(minutes: 15);
      }
    });
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Volver',
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/tomates.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.red.withOpacity(0.5),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            color: Colors.red
                .withOpacity(0.5), // Capa de color rojo con opacidad del 50%
            width: MediaQuery.of(context)
                .size
                .width, // Ancho igual al ancho de la pantalla
            height: MediaQuery.of(context)
                .size
                .height, // Alto igual al alto de la pantalla
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _showClockImage = false;
              });
              _animationController.stop();
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedOption = 'Pomodoro';
                            _resetTimer();
                          });
                        },
                        child: const Text('Pomodoro'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedOption = 'Short Break';
                            _resetTimer();
                          });
                        },
                        child: const Text('Short Break'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedOption = 'Long Break';
                            _resetTimer();
                          });
                        },
                        child: const Text('Long Break'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _selectedOption,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  _showClockImage
                      ? AnimatedBuilder(
                          animation: _rotateAnimation,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: _rotateAnimation.value * (3.1415927 / 180),
                              child: Image.asset(
                                'images/clock_timeout.png',
                                width: 200,
                                height: 200,
                              ),
                            );
                          },
                        )
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(10), // Bordes redondeados
                            color: Colors.red, // Color de relleno rojo
                          ),
                          padding: const EdgeInsets.all(8), // Relleno interior
                          child: Text(
                            '${_timerDuration.inMinutes}:${(_timerDuration.inSeconds % 60).toString().padLeft(2, '0')}',
                            style: const TextStyle(
                              fontSize: 60,
                              color: Colors.white, // Color del texto
                              // Propiedades para el borde del texto
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black, // Color del borde
                                  blurRadius: 2, // Grosor del borde
                                ),
                              ],
                            ),
                          ),
                        ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_isRunning) {
                        _stopTimer();
                      } else {
                        _startTimer();
                      }
                    },
                    child: Text(_isRunning ? 'STOP' : 'START'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _animationController.dispose();
    super.dispose();
  }
}
