import 'package:flutter/material.dart';
import 'package:vikraya/domain/constants/appcolors.dart';
import 'package:vikraya/repository/screens/bottom_nav/le_bns.dart';

class LivingEssentailsPage extends StatefulWidget {
  const LivingEssentailsPage({super.key});

  @override
  State<LivingEssentailsPage> createState() => _LivingEssentailsPageState();
}

class _LivingEssentailsPageState extends State<LivingEssentailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: LeBns(),
      ),
    );
  }
}
