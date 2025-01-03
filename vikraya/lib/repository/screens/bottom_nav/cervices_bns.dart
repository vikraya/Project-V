import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:vikraya/domain/constants/appcolors.dart';
import 'package:vikraya/repository/screens/cart/cervices_cart_screen.dart';
import 'package:vikraya/repository/screens/favourite/cervices_favouritepage.dart';
import 'package:vikraya/repository/screens/home/cervices_home_screen.dart';
import 'package:vikraya/repository/screens/payment/payment_screen.dart';
import 'package:vikraya/repository/screens/profile/profile_screens.dart';

class CervicesBns extends StatefulWidget {
  const CervicesBns({super.key});

  @override
  State<CervicesBns> createState() => _CervicesBnsState();
}

class _CervicesBnsState extends State<CervicesBns> {
    int _currentIndex = 0;

   final List<Widget> _screens = [
    CervicesHomeScreen(),
    CervicesFavouritepage(),
    PaymentScreen(),
    CervicesCartScreen(),
    ProfileScreens(),
  ];

  final List<Widget> _navigationItem = [
    const Icon(
      Icons.home_outlined,
      color: Colors.white,
      semanticLabel: "our HScreen",
    ),
    const Icon(
      Icons.favorite_border_outlined,
      color: Colors.white,
      semanticLabel: "Loved One's",
    ),
    const Icon(
      Icons.qr_code_scanner_rounded,
      color: Colors.white,
      semanticLabel: "Payment",
    ),
    const Icon(
      Icons.shopping_cart_outlined,
      color: Colors.white,
      semanticLabel: "Cart",
    ),
    const Icon(
      Icons.person_outline_rounded,
      color: Colors.white,
      semanticLabel: "Profile",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
      bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          backgroundColor: Colors.black,
          color: AppColors.bottomNavigationBarColorMS,
          index: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: _navigationItem,
        ));
  }
}