import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPage();
}

class _NotificationPage extends State<NotificationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<AnimatedContainer> _chartBars;
  final _heightTween = Tween<double>(begin: 0, end: 200);
  late List<ColorTween> _colorTweens;

  @override
  void initState() {
    super.initState();

    _chartBars = [
      AnimatedContainer(
        height: 200,
        width: 30,
        duration: const Duration(seconds: 1),
      ),
      AnimatedContainer(
        height: 200,
        width: 30,
        duration: const Duration(seconds:1),
      ),
      AnimatedContainer(
        height: 200,
        width: 30,
        duration: const Duration(seconds: 1),
      ),
    ];

    _colorTweens = [
      ColorTween(begin: Colors.blue, end: Colors.red),
      ColorTween(begin: Colors.green, end: Colors.orange),
      ColorTween(begin: Colors.purple, end: Colors.yellow),
    ];

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _controller.addListener(() {
      setState(() {
        for (var i = 0; i < _chartBars.length; i++) {
          final height = _heightTween.animate(_controller).value;
          final color = _colorTweens[i].evaluate(_controller);
          _chartBars[i] = AnimatedContainer(
            height: height,
            width: 30,
            color: color,
            duration: Duration.zero,
          );
        }
      });
    });

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _chartBars,
        ),
      ),
    );
  }
}