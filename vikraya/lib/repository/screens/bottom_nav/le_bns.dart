import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:vikraya/domain/constants/appcolors.dart';
import 'package:vikraya/repository/screens/cart/le_cart_screen.dart';
import 'package:vikraya/repository/screens/favourite/le_favourite_page.dart';
import 'package:vikraya/repository/screens/home/homescreen.dart';
import 'package:vikraya/repository/screens/home/le_home_screen.dart';
import 'package:vikraya/repository/screens/main_screen.dart';
import 'package:vikraya/repository/screens/payment/payment_screen.dart';
import 'package:vikraya/repository/screens/profile/profile_screens.dart';

class LeBns extends StatefulWidget {
  const LeBns({super.key});

  @override
  State<LeBns> createState() => _LeBnsState();
}

class _LeBnsState extends State<LeBns> {
  int _currentIndex = 0;

  List<Widget> _screens = [
    LeHomeScreen(),
    LeFavouritePage(),
    PaymentScreen(),
    LeCartScreen(),
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
        bottomNavigationBar: GestureDetector(
          onDoubleTap: () {
            setState(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            });
          },
          child: CurvedNavigationBar(
            height: 50,
            backgroundColor: Colors.black,
            color: AppColors.bottomNavigationBarColorLe,
            index: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: _navigationItem,
          ),
        ));
  }
}
