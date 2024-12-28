import 'package:flutter/material.dart';
import 'package:vikraya/domain/constants/appcolors.dart';
import 'package:vikraya/repository/screens/categories/lg_categories_page.dart';

class LgHomeScreen extends StatefulWidget {
  const LgHomeScreen({super.key});

  @override
  State<LgHomeScreen> createState() => _LgHomeScreenState();
}

class _LgHomeScreenState extends State<LgHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarLg(context),
        ),
        body: const LgCategoriesListGrid(),
      ),
    );
  }
}
