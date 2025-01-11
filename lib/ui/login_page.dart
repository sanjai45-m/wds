import 'dart:convert';
import 'package:demo/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../reuse_widgets/reuse.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({super.key});

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _login() async {
    String email = emailController.text;
    String password = passwordController.text;

    var url = Uri.parse("https://webdynasite.com/demo/rest-api/panel/login");

    var headers = {
      "Authorization": "Basic ${base64Encode(utf8.encode("partner:2923"))}",
      "x-api-key": "Zinc@copper24",
    };

    var body = {
      "email_id": email,
      "password": password,
    };

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);

      if (responseBody['status'] == 'success') {
        String id = responseBody['data']['id'];

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful!')),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => BottomNavigationExample(id: id)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid credentials. Please try again.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again later.')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false, // Prevent resizing when the keyboard appears
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 100),
                          Center(
                            child: SvgPicture.asset('assets/images/logowhite1.svg'),
                          ),
                          SizedBox(height: 100),
                          ReUse().texts("Hello , Everyone", 22, Colors.white),
                          ReUse().texts("Primary Login Content", 12, Colors.white),
                          SizedBox(height: 20),
                          ReUse().TextFieldLogin(
                            emailController,
                            '    User name',
                            Icons.person_outline,
                                (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          ReUse().TextFieldLogin(
                            passwordController,
                            "    Password",
                            Icons.lock_outline,
                                (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            },
                            isPassword: true,
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: 300,
                            height: 51,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _login();
                                }
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ReUse().texts("Forgot Password?", 12, Colors.white),
                              InkWell(
                                onTap: () {
                                  // Add your onTap functionality here
                                },
                                child: RichText(
                                  text: TextSpan(
                                    text: ' Recover Here',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReUse().texts("Don't have an account?", 12, Colors.white),
                  InkWell(
                    onTap: () {
                      // Add your onTap functionality here
                    },
                    child: RichText(
                      text: TextSpan(
                        text: ' Contact',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
