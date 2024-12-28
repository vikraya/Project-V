import 'package:flutter/material.dart';

class LgCartScreen extends StatefulWidget {
  const LgCartScreen({super.key});

  @override
  State<LgCartScreen> createState() => _LgCartScreenState();
}

class _LgCartScreenState extends State<LgCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('LgCartScreen'),
      ),
    );
  }
}