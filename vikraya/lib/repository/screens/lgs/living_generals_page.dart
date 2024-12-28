import 'package:flutter/material.dart';
import 'package:vikraya/domain/constants/appcolors.dart';
import 'package:vikraya/repository/screens/bottom_nav/lg_bns.dart';

class LivingGeneralsPage extends StatefulWidget {
  const LivingGeneralsPage({super.key});

  @override
  State<LivingGeneralsPage> createState() => _LivingGeneralsPageState();
}

class _LivingGeneralsPageState extends State<LivingGeneralsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: const LgBns(),
      ),
    );
  }
}
