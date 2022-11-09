import 'package:flutter/material.dart';
import 'package:future_job_app/theme.dart';
import 'package:future_job_app/widgets/posted_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondHomePage extends StatelessWidget {
  final String imageUrl;
  final String jobText;

  SecondHomePage({required this.imageUrl, required this.jobText});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(20),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 270,
                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, top: 200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            jobText,
                            style: jobTitleStyle,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '12,309 available',
                            style: availableJobStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Big Companies',
                        style: GoogleFonts.poppins(
                          color: blackColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 16),
                      PostedWidget(
                        imageUrl: 'assets/icon1.png',
                        title: 'Front-End Developer',
                        subtitle: 'Google',
                      ),
                      PostedWidget(
                        imageUrl: 'assets/icon2.png',
                        title: 'UI Designer',
                        subtitle: 'Instagram',
                      ),
                      PostedWidget(
                        imageUrl: 'assets/icon3.png',
                        title: 'Data Scientist',
                        subtitle: 'Facebook',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24, bottom: 16, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Startups',
                        style: GoogleFonts.poppins(
                          color: blackColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 16),
                      PostedWidget(
                        imageUrl: 'assets/icon1.png',
                        title: 'Front-End Developer',
                        subtitle: 'Google',
                      ),
                      PostedWidget(
                        imageUrl: 'assets/icon2.png',
                        title: 'UI Designer',
                        subtitle: 'Instagram',
                      ),
                      PostedWidget(
                        imageUrl: 'assets/icon3.png',
                        title: 'Data Scientist',
                        subtitle: 'Facebook',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
