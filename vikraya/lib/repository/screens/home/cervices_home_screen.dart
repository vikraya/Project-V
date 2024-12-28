import 'package:flutter/material.dart';

class CervicesHomeScreen extends StatefulWidget {
  const CervicesHomeScreen({super.key});

  @override
  State<CervicesHomeScreen> createState() => _CervicesHomeScreenState();
}

class _CervicesHomeScreenState extends State<CervicesHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('CervicesHomeScreen'),
      ),
    );
  }
}