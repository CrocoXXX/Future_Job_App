import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:future_job_app/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isEmailValid = true;

  TextEditingController emailController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign In',
                style: titleStyle,
              ),
              const SizedBox(height: 2),
              Text(
                'Build Your Career',
                style: subtitleStyle,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Image.asset(
                    'assets/illustration1.png',
                    width: 262,
                    height: 240,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      style: GoogleFonts.poppins(
                        fontSize: 16,
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
                            color: purpleColor,
                          ),
                        ),
                        hintText: '',
                      ),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: purpleColor,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 400,
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: purpleColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(66),
                    ),
                  ),
                  child: Text(
                    'Sign In',
                    style: buttonStyle,
                  ),
                ),
              ),
              Align(
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    'Create New Account',
                    style: GoogleFonts.poppins(
                      color: const Color(0xffB3B5C4),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
