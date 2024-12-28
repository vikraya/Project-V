import 'package:flutter/material.dart';
import 'package:vikraya/domain/constants/appcolors.dart';
import 'package:vikraya/repository/screens/categories/le_categories_page.dart';


class LeHomeScreen extends StatefulWidget {
  const LeHomeScreen({super.key});

  @override
  State<LeHomeScreen> createState() => _LeHomeScreenState();
}

class _LeHomeScreenState extends State<LeHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarLe(context),
        
        ),
        body:  LeCategoriesListGrid(),
      ),
    );
  }
}