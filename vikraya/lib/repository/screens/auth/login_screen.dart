import 'package:flutter/material.dart';
import 'package:vikraya/repository/screens/auth/pallete.dart';
import 'package:vikraya/repository/screens/auth/widgets/gradient_button.dart';
import 'package:vikraya/repository/screens/auth/widgets/login_field.dart';
import 'package:vikraya/repository/screens/auth/widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _useridController = TextEditingController();
  final _passwordController = TextEditingController();
  final bool _isPasswordVisible = true;
  bool _isLoginButtonEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/signin_balls.png'),
              const Text(
                'Sign in.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Pallete.whiteColor,
                ),
              ),
              const SizedBox(height: 50),
              const SocialButton(
                  iconPath: 'assets/svgs/g_logo.svg',
                  label: 'Continue with Google'),
              const SizedBox(height: 20),
              const SocialButton(
                iconPath: 'assets/svgs/f_logo.svg',
                label: 'Continue with Facebook',
                horizontalPadding: 90,
              ),
              const SizedBox(height: 15),
              const Text(
                'or',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 15),
              LoginField(
                  hintText: 'Email',
                  controller: _useridController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined),
                  obscureText: false),
              const SizedBox(height: 15),
              LoginField(
                hintText: 'Password',
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(_isPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility),
                ),
                obscureText: _isPasswordVisible,
              ),
              const SizedBox(height: 20),
              const GradientButton(),
            ],
          ),
        ),
      ),
    );
  }
}
