import 'package:flutter/material.dart';
import 'package:vikraya/repository/screens/auth/login_screen.dart';
import 'package:vikraya/repository/screens/auth/pallete.dart';
import 'package:vikraya/repository/screens/auth/widgets/gradient_button.dart';
import 'package:vikraya/repository/screens/auth/widgets/login_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();
  final phonecontroller = TextEditingController();
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
              SizedBox(height: 10),
              Column(
                children: [
                  Image.asset(
                    'assets/img/main_page/V_O_n_C_Logo crop-min.png',
                    height: 150,
                    width: 150,
                  ),
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Pallete.whiteColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              LoginField(
                hintText: 'Email',
                hintStyle: const TextStyle(color: Pallete.whiteColor),
                controller: _emailcontroller,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_outlined),
                suffixIcon: null,
                obscureText: false,
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*|+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return " Enter a valid email!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              LoginField(
                hintText: 'Password',
                hintStyle: const TextStyle(color: Pallete.whiteColor),
                controller: _passwordcontroller,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(_isPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility),
                  color: Pallete.whiteColor,
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
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
              LoginField(
                hintText: 'Confirm Password',
                hintStyle: const TextStyle(color: Pallete.whiteColor),
                controller: _confirmpasswordcontroller,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(_isPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility),
                  color: Pallete.whiteColor,
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
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
                    }
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              LoginField(
                hintText: 'Phone',
                hintStyle: const TextStyle(color: Pallete.whiteColor),
                controller: phonecontroller,
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(Icons.phone),
                suffixIcon: null,
                obscureText: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const GradientButton(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isLoginEnabled = !_isLoginEnabled;
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: const Text(
                      'Already have an account? signin',
                      style: TextStyle(
                        color: Pallete.whiteColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
