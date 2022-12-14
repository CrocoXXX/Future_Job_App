import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:future_job_app/models/user_model.dart';
// import 'package:future_job_app/pages/homepage.dart';
import 'package:future_job_app/pages/signin_page.dart';
import 'package:future_job_app/providers/auth_provider.dart';
import 'package:future_job_app/providers/user_provider.dart';
import 'package:future_job_app/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Email Validator
  bool isEmailValid = true;
  // Image Upload
  bool isUploaded = true;

  // Controller
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController goalController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    void showError(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: redColor,
          content: Text(message),
        ),
      );
    }

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
            child: Image.asset(
              'assets/upload_image.png',
              width: 120,
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
            child: Image.asset(
              'assets/user_pic.png',
              width: 120,
            ),
          ),
        ),
      );
    }

    Widget inputName() {
      return TextFormField(
        controller: nameController,
        onChanged: (value) {
          setState(() {});
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
              color: purpleColor,
            ),
          ),
          hintText: '',
        ),
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: purpleColor,
          // decoration: TextDecoration.underline,
        ),
      );
    }

    Widget inputEmail() {
      return TextFormField(
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
      );
    }

    Widget inputPassword() {
      return TextFormField(
        obscureText: true,
        controller: passwordController,
        onChanged: (value) {
          setState(() {});
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
              color: purpleColor,
            ),
          ),
          hintText: '',
        ),
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: purpleColor,
        ),
      );
    }

    Widget inputGoal() {
      return TextFormField(
        controller: goalController,
        onChanged: (value) {
          setState(() {});
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
              color: purpleColor,
            ),
          ),
          hintText: '',
        ),
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: purpleColor,
        ),
      );
    }

    Widget signUpButton() {
      return Container(
        width: 400,
        height: 50,
        margin: const EdgeInsets.only(bottom: 20),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : TextButton(
                onPressed: () async {
                  if (nameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      goalController.text.isEmpty) {
                    showError('Semua Field Harus Diisi');
                  } else {
                    setState(() {
                      isLoading = true;
                    });

                    UserModel? user = await authProvider.register(
                      emailController.text,
                      passwordController.text,
                      nameController.text,
                      goalController.text,
                    );

                    setState(() {
                      isLoading = false;
                    });

                    if (user == null) {
                      showError('Email Sudah Terdaftar Sebelumnya');
                    } else {
                      userProvider.user = user;
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/home', (route) => false);
                    }
                  }
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
      );
    }

    Widget backToSignIn() {
      return Align(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInPage(),
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
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 24, right: 24, bottom: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign Up',
                style: titleStyle,
              ),
              Text(
                'Begin New Journey',
                style: subtitleStyle,
              ),
              isUploaded ? uploadedImages() : showedImages(),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Name',
                      style: titleStyle,
                    ),
                    const SizedBox(height: 8),
                    inputName(),
                    const SizedBox(height: 20),
                    Text(
                      'Email Address',
                      style: titleStyle,
                    ),
                    const SizedBox(height: 8),
                    inputEmail(),
                    const SizedBox(height: 20),
                    Text(
                      'Password',
                      style: titleStyle,
                    ),
                    const SizedBox(height: 8),
                    inputPassword(),
                    const SizedBox(height: 20),
                    Text(
                      'Your Goal',
                      style: titleStyle,
                    ),
                    const SizedBox(height: 8),
                    inputGoal(),
                  ],
                ),
              ),
              signUpButton(),
              backToSignIn(),
            ],
          ),
        ),
      ),
    );
  }
}
