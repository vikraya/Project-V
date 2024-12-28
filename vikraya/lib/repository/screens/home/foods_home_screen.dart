import 'package:flutter/material.dart';
import 'package:vikraya/domain/constants/appcolors.dart';
import 'package:vikraya/repository/screens/categories/foods_categories_page.dart';

class FoodsHomeScreen extends StatefulWidget {
  const FoodsHomeScreen({super.key});

  @override
  State<FoodsHomeScreen> createState() => _FoodsHomeScreenState();
}

class _FoodsHomeScreenState extends State<FoodsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50), child: AppBarFS(context)),
        backgroundColor: AppColors.scaffoldBackground,
        body: const FoodsCategoriesListGrid(),
      ),
    );
  }
}
