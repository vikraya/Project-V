import 'package:flutter/material.dart';
import 'package:vikraya/domain/constants/appcolors.dart';
import 'package:vikraya/repository/screens/bottom_nav/food_bns.dart';

class Foodspage extends StatefulWidget {
  const Foodspage({super.key});

  @override
  State<Foodspage> createState() => _FoodspageState();
}

class _FoodspageState extends State<Foodspage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: const FoodBns()),
    );
  }
}