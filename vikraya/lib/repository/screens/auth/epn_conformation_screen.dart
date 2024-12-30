import 'package:flutter/material.dart';
import 'package:vikraya/repository/screens/auth/pallete.dart';
import 'package:vikraya/repository/screens/auth/widgets/gradient_button.dart';
import 'package:vikraya/repository/screens/auth/widgets/login_field.dart';
import 'package:vikraya/repository/screens/main_screen.dart';
import 'package:vikraya/services/auth_service.dart';

class EpnConformationScreen extends StatefulWidget {
  final String email;
  const EpnConformationScreen({super.key,required this.email});


  @override
  State<EpnConformationScreen> createState() => _EpnConformationScreenState();
}

class _EpnConformationScreenState extends State<EpnConformationScreen> {

  final _otp = TextEditingController();
  // final PhoneNubercontroller = TextEditingController();
  bool _OtpConfirmationScreen = false;

  void confirmSignup(String email,String otp) async {
    print(otp);
    print(email);
    if(otp.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("otp field should not be empty"))
      );
      return;
    }

    AuthService auth = AuthService('http://localhost:8000');

    try{
      final response = await auth.confirmSignup(email, otp);
       if (!mounted) return; // Ensure widget is still in the tree
      if (response['message'] == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Unexpected error occurred. Please try again.")),
        );
        return;
      } else if(response['message'] == "Confirmation Successful"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
      }
      else{
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'])),
        );
      }
    }catch(e){
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          backgroundColor: Pallete.backgroundColor,
          body: SingleChildScrollView(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/signin_balls.png"),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Image.asset(
                      "assets/img/main_page/V_O_n_C_Logo crop-min.png",
                      height: 80,
                      width: 80,
                    ),
                    const Text(
                      "Email Verification Screen",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Pallete.whiteColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Center(
                  child: LoginField(
                    hintText: "Email Code",
                    controller: _otp,
                    obscureText: _OtpConfirmationScreen,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an OTP';
                      }
                      final otpRegex = RegExp(r'^\d{6}$'); // 6-digit OTP
                      if (!otpRegex.hasMatch(value)) {
                        return 'Invalid OTP. Please enter a 6-digit code';
                      }
                      return null; // input is valid
                    },
                    width: 300,
                    height: 50,
                    hintStyle: TextStyle(color: Pallete.whiteColor),
                    prefixIcon:
                        const Icon(Icons.email, color: Pallete.whiteColor),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _OtpConfirmationScreen
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      color: Pallete.whiteColor,
                      onPressed: () {
                        setState(() {
                          _OtpConfirmationScreen = !_OtpConfirmationScreen;
                        });
                      },
                    ),
                  ),
                ),
                // SizedBox(height: 10),
                // LoginField(
                //   hintText: "Phone Number Verifiction Code",
                //   controller: PhoneNubercontroller,
                //   obscureText: true,
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return 'Please enter an OTP';
                //     }
                //     final otpRegex = RegExp(r'^\d{4,6}$'); // 4-6 digit OTP
                //     if (!otpRegex.hasMatch(value)) {
                //       return 'Invalid OTP. Please enter a 4-6 digit code';
                //     }
                //     return null; // input is valid
                //   },
                //   width: 300,
                //   height: 500,
                //   hintStyle: TextStyle(color: Pallete.whiteColor),
                //   prefixIcon:
                //       const Icon(Icons.phone, color: Pallete.whiteColor),
                //   suffixIcon: IconButton(
                //     onPressed: () {
                //       setState(() {
                //         _OtpConfirmationScreen = !_OtpConfirmationScreen;
                //       });
                //     },
                //     icon: Icon(
                //         _OtpConfirmationScreen
                //             ? Icons.visibility_off
                //             : Icons.visibility,
                //         color: Pallete.whiteColor),
                //   ),
                // ),
                SizedBox(height: 10),
                Center(
                  child: GradientButton(
                      onPressed: () {
                        setState(
                          () {
                            confirmSignup(widget.email, _otp.text);
                          },
                        );
                      },
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
