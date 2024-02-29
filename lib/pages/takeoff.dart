import 'package:flutter/material.dart';

class Takeoff extends StatefulWidget {
  const Takeoff({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<Takeoff> createState() => _TakeoffState();
}

class _TakeoffState extends State<Takeoff> {
  @override
  Widget build(BuildContext context) {
    return const Text('Hello');
  }
}
