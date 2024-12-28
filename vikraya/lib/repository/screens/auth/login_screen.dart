import 'package:flutter/material.dart';
import 'package:vikraya/repository/screens/auth/pallete.dart';
import 'package:vikraya/repository/screens/auth/signup_screen.dart';
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
  bool _isPasswordVisible = true;
  bool _isLoginEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/signin_balls.png'),
              const SizedBox(height: 20),
              Column(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/img/main_page/V_O_n_C_Logo crop-min.png",
                      height: 100,
                      width: 150,
                    ),
                  ),
                  const Text(
                    'Sign in.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Pallete.whiteColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
                  color: Pallete.whiteColor,
                ),
              ),
              const SizedBox(height: 15),
              LoginField(
                hintText: 'Email',
                hintStyle: const TextStyle(color: Pallete.whiteColor),
                controller: _useridController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_outlined),
                obscureText: false,
                suffixIcon: null,
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*|+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return " Enter a valid email!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              LoginField(
                hintText: 'Password',
                hintStyle: const TextStyle(color: Pallete.whiteColor),
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  icon: Icon(_isPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility),
                ),
                obscureText: _isPasswordVisible,
                validator: (value) {
                  RegExp regex = RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  } else {
                    if (!regex.hasMatch(value)) {
                      return 'Enter valid password';
                    } else {
                      return null;
                    }
                  }
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isLoginEnabled = true;
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()));
                      });
                    },
                    child: const Text(
                      "Don't have an account? Signup",
                      style: TextStyle(
                        fontSize: 16,
                        color: Pallete.whiteColor,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Pallete.whiteColor,
                      ),
                    ),
                  ),
                ],
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
