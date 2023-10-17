import 'dart:async';

import 'package:flutter/material.dart';

class ClockApp extends StatefulWidget {
  @override
  _ClockAppState createState() => _ClockAppState();
}

class _ClockAppState extends State<ClockApp> {
  Timer? _timer;
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    _updateTime();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    final now = DateTime.now();
    setState(() {
      _currentTime = '${now.hour}:${now.minute}:${now.second}';
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 59, 0, 101),
      body: Center(
        child: AnimatedDefaultTextStyle(
          duration: const Duration(seconds: 1),
          style: TextStyle(
            color: Colors.white,
            fontSize: 290,
            fontWeight: FontWeight.bold,
          ),
          child: Text(
            _currentTime,
          ),
        ),
      ),
    );
  }
}
