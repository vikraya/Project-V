// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:vikraya/repository/screens/auth/pallete.dart';

class LoginField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextStyle? hintStyle;
  const LoginField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    required this.obscureText,
    required this.validator,
    this.hintStyle,
    required int width,
    required int height,
  });

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 250,
        maxHeight: 100,
      ),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(27),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Pallete.borderColor,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Pallete.gradient2,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 3),
            ),
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10),
            )),
        validator: widget.validator,
        style: widget.hintStyle,
      ),
    );
  }
}
