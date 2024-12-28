import 'package:flutter/material.dart';
import 'package:vikraya/domain/constants/appcolors.dart';
import 'package:vikraya/repository/screens/bottom_nav/cervices_bns.dart';

class CevicesPage extends StatefulWidget {
  const CevicesPage({super.key});

  @override
  State<CevicesPage> createState() => _CevicesPageState();
}

class _CevicesPageState extends State<CevicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: const CervicesBns());
  }
}