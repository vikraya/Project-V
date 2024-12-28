import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vikraya/domain/constants/appcolors.dart';
import 'package:vikraya/repository/screens/auth/login_screen.dart';
import 'package:vikraya/repository/screens/auth/signup_screen.dart';
import 'package:vikraya/repository/screens/main_screen.dart';
import 'package:vikraya/repository/widgets/uihelper.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignupScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Uihelper.CoustomImagess(img: "VOnC ss.gif"),
            ),
          ),
        ],
      ),
    );
  }
}
