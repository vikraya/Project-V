import 'package:flutter/material.dart';

class FavouriteScreens extends StatefulWidget {
  const FavouriteScreens({super.key});

  @override
  State<FavouriteScreens> createState() => _FavouriteScreensState();
}

class _FavouriteScreensState extends State<FavouriteScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite'),
      ),
    );
  }
}