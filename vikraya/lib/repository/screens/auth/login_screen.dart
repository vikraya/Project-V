import 'package:flutter/material.dart';
import 'package:vikraya/repository/screens/auth/pallete.dart';
import 'package:vikraya/repository/screens/auth/signup_screen.dart';
import 'package:vikraya/repository/screens/auth/widgets/gradient_button.dart';
import 'package:vikraya/repository/screens/auth/widgets/login_field.dart';
import 'package:vikraya/repository/screens/auth/widgets/social_button.dart';
import 'package:vikraya/repository/screens/main_screen.dart';
import 'package:vikraya/services/auth_service.dart';

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

  void login(String userid, String password) async {
 // Validating details if they are empty or not
  if (userid.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Please enter both email and password")),
    );
    return;
  }

  AuthService authService = AuthService('http://localhost:8000');

  try {
    final response = await authService.logIn(userid, password);

    if (!mounted) return; // Ensure widget is still in the tree
    
    if (response['message'] == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Unexpected error occurred. Please try again.")),
      );
      
      return;
    }

    if (response['message'] == "Login successful") {
      // Navigate to the next screen 
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['message'])),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("An error occurred: ${e.toString()}")),
    );
    print("Login error: $e");
  }
}


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                        height: 80,
                        width: 80,
                      ),
                    ),
                    const Text(
                      'Sign in',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Pallete.whiteColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SocialButton(
                  iconPath: 'assets/svgs/g_logo.svg',
                  label: 'Continue with Google',
                  horizontalPadding: 30,
                  verticalPadding: 5,
                  onPressed: () {},
                ),
                const SizedBox(height: 11),
                const Text(
                  'or',
                  style: TextStyle(
                    fontSize: 17,
                    color: Pallete.whiteColor,
                  ),
                ),
                const SizedBox(height: 11),
                LoginField(
                  height: 30,
                  width: 150,
                  hintText: 'Email',
                  hintStyle: const TextStyle(color: Pallete.whiteColor),
                  controller: _useridController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon:
                      const Icon(Icons.email_outlined, color: Pallete.whiteColor),
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
                const SizedBox(height: 10),
                LoginField(
                  height: 20,
                  width: 150,
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Pallete.whiteColor),
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: const Icon(Icons.lock, color: Pallete.whiteColor),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    color: Pallete.whiteColor,
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
                const SizedBox(height: 10),
                Column(
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
                    const SizedBox(height: 10),
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
                const SizedBox(height: 10),
                GradientButton(
                  onPressed: () {
                    login(_useridController.text, _passwordController.text);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
