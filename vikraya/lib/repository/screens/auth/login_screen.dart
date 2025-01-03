import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  // GoogleSignIn signIn = GoogleSignIn();
  //
  // Future<void> GoogleSignin() async {
  //   try {
  //     var user = await signIn.signIn();
  //     print(user);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  final _useridController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = true;
  bool _isLoginEnabled = true;

  void login(String userid, String password) async {
    // Validating details if they are empty or not
    if (userid.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter both email and password")),
      );
      return;
    }

    AuthService authService = AuthService('http://192.168.0.2:8000');

    try {
      final response = await authService.logIn(userid, password);

      if (!mounted) return; // Ensure widget is still in the tree

      if (response['message'] == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Unexpected error occurred. Please try again.")),
        );

        return;
      }
      setState(() {
        _isLoginEnabled = true;
      });

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
                  onPressed: () {
                    //GoogleSignin();
                  },
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
                  prefixIcon: const Icon(Icons.email_outlined,
                      color: Pallete.whiteColor),
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
                        _isLoginEnabled = false;
                        setState(() {
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
                    _isLoginEnabled
                        ? login(
                            _useridController.text, _passwordController.text)
                        : null;
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
