// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Uihelper {
  //images
  // splash scrren
  static CoustomImagess({required String img}) {
    return Image.asset("assets/videos/gifs/$img");
  }

// main page images
  static CustomImagesMS(
      {required String img,
      required double height,
      required double width,
      BoxFit? fit}) {
    return Image.asset("assets/img/main_page/$img");
  }

  // Food images
  static CustomImagesF(
      {required String img,
      required double height,
      required double width,
      BoxFit? fit}) {
    return Image.asset("assets/img/foods/$img");
  }

  // Grocery images
  static CustomImagesLe(
      {required String img,
      required double height,
      required double width,
      BoxFit? fit}) {
    return Image.asset("assets/img/living_essentials/$img");
  }

  // Fashion images
  static CustomImagesLg(
      {required String img,
      required double height,
      required double width,
      BoxFit? fit}) {
    return Image.asset("assets/img/living_generals/$img");
  }

  // Cevices images
  static CustomImagesC(
      {required String img,
      required double height,
      required double width,
      BoxFit? fit}) {
    return Image.asset("assets/img/cevices/$img");
  }

  // icons
  static CustomIcons(
      {required String img,
      required double height,
      required double width,
      BoxFit? fit}) {
    return Image.asset("assets/icons/$img");
  }

  static CustomText(
      {required String text,
      required double size,
      required Color color,
      required FontWeight weight,
      String? family}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
        fontFamily: family,
      ),
    );
  }
}
