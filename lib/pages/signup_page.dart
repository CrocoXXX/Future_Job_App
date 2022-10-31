import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:future_job_app/pages/homepage.dart';
import 'package:future_job_app/pages/signin_page.dart';
import 'package:future_job_app/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isEmailValid = true;
  bool isUploaded = false;

  TextEditingController emailController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget uploadedImages() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Center(
          child: InkWell(
            onTap: () {
              setState(() {
                isUploaded = !isUploaded;
              });
            },
            child: Column(
              children: [
                Image.asset(
                  'assets/user_pic.png',
                  width: 120,
                  height: 120,
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget showedImages() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Center(
          child: InkWell(
            onTap: () {
              setState(() {
                isUploaded = !isUploaded;
              });
            },
            child: Column(
              children: [
                Image.asset(
                  'assets/show_image.png',
                  width: 120,
                  height: 120,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 30, right: 24, left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign Up',
                    style: titleStyle,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Begin New Journey',
                    style: subtitleStyle,
                  ),
                  isUploaded ? uploadedImages() : showedImages(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Full Name',
                        style: titleStyle,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(
                          fillColor: const Color(0xffF1F0F5),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: isEmailValid ? purpleColor : redColor,
                            ),
                          ),
                          hintText: '',
                        ),
                        style: TextStyle(
                          color: isEmailValid ? purpleColor : redColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Email Address',
                        style: titleStyle,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: emailController,
                        onChanged: (value) {
                          debugPrint(value);
                          bool isValid = EmailValidator.validate(value);
                          print(isValid);
                          if (isValid) {
                            setState(() {
                              isEmailValid = true;
                            });
                          } else {
                            setState(() {
                              isEmailValid = false;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          fillColor: const Color(0xffF1F0F5),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: isEmailValid ? purpleColor : redColor,
                            ),
                          ),
                          hintText: '',
                        ),
                        style: TextStyle(
                          color: isEmailValid ? purpleColor : redColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Password',
                        style: titleStyle,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: const Color(0xffF1F0F5),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: isEmailValid ? purpleColor : redColor,
                            ),
                          ),
                          hintText: '',
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Your Goal',
                        style: titleStyle,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(
                          fillColor: const Color(0xffF1F0F5),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: isEmailValid ? purpleColor : redColor,
                            ),
                          ),
                          hintText: '',
                        ),
                        style: TextStyle(
                          color: isEmailValid ? purpleColor : redColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 40,
                          bottom: 76,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 400,
                              height: 50,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: purpleColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(66),
                                  ),
                                ),
                                child: Text(
                                  'Sign Up',
                                  style: buttonStyle,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignIn(),
                                  ),
                                );
                              },
                              child: Text(
                                'Back to Sign In',
                                style: GoogleFonts.poppins(
                                  color: greyColor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
