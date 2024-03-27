import 'dart:async';
import 'package:flutter/material.dart';

class PomodoroWidget extends StatefulWidget {
  const PomodoroWidget({Key? key}) : super(key: key);

  @override
  _PomodoroWidgetState createState() => _PomodoroWidgetState();
}

class _PomodoroWidgetState extends State<PomodoroWidget>
    with TickerProviderStateMixin {
  String _selectedOption = 'Pomodoro';
  late Duration _timerDuration;
  late Timer _timer;
  bool _isRunning = false;
  bool _showClockImage = false;

  late AnimationController _animationController;
  late Animation<double> _rotateAnimation;

  TextEditingController _timeController = TextEditingController();

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
      _timeController.text = _timerDuration.inMinutes.toString();
    });
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _selectTime('Pomodoro', const Duration(minutes: 25));
                  },
                  child: const Text('Pomodoro'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _selectTime('Short Break', const Duration(minutes: 5));
                  },
                  child: const Text('Short Break'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _selectTime('Long Break', const Duration(minutes: 15));
                  },
                  child: const Text('Long Break'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _timeController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Tiempo en minutos',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _applyCustomTime();
              },
              child: const Text('Aplicar tiempo personalizado'),
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
            const SizedBox(height: 20),
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
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      '${_timerDuration.inMinutes}:${(_timerDuration.inSeconds % 60).toString().padLeft(2, '0')}',
                      style: const TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void _selectTime(String option, Duration duration) {
    setState(() {
      _selectedOption = option;
      _timerDuration = duration;
      _timeController.text = _timerDuration.inMinutes.toString();
    });
  }

  void _applyCustomTime() {
    int minutes = int.tryParse(_timeController.text) ?? 0;
    setState(() {
      _timerDuration = Duration(minutes: minutes);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _animationController.dispose();
    _timeController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(const MaterialApp(
    home: PomodoroWidget(),
  ));
}
