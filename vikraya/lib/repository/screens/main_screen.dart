import 'package:flutter/material.dart';
import 'package:vikraya/domain/constants/appcolors.dart';
import 'package:vikraya/repository/screens/bottom_nav/bottom_nav_screen.dart';
import 'package:vikraya/repository/screens/categories/categories_list_grid.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarMS(context),
        ),
        backgroundColor: AppColors.scaffoldBackground,
        body: BottomNavScreen(),
      ),
    );
  }
}
