import 'package:flutter/material.dart';

class LeCartScreen extends StatefulWidget {
  const LeCartScreen({super.key});

  @override
  State<LeCartScreen> createState() => _LeCartScreenState();
}

class _LeCartScreenState extends State<LeCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('LeCartScreen'),
      ),
    );
  }
}