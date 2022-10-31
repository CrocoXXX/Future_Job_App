import 'package:flutter/material.dart';
import 'package:future_job_app/theme.dart';
import 'package:future_job_app/widgets/posted_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondHomePage extends StatelessWidget {
  final String jobTitleHome;
  final String imageUrl;

  const SecondHomePage({
    required this.jobTitleHome,
    required this.imageUrl,
  });

  // const SecondHomePage({
  //   required this.jobTitleHome,
  //   required this.imageUrl,
  // }): super(key: key);

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
                    // Text('Ini Pages Website Developer'),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 200,
                        left: 24,
                        bottom: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            jobTitleHome,
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Big Companies',
                        style: GoogleFonts.poppins(
                          color: blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Column(
                        children: const [
                          JustPosted(
                            imageUrl: 'assets/icon1.png',
                            job: 'Front-End Developer',
                            company: 'Google',
                          ),
                          JustPosted(
                            imageUrl: 'assets/icon2.png',
                            job: 'UI Designer',
                            company: 'Instagram',
                          ),
                          JustPosted(
                            imageUrl: 'assets/icon3.png',
                            job: 'Data Scientist',
                            company: 'Facebook',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Startups',
                        style: GoogleFonts.poppins(
                          color: blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Column(
                        children: const [
                          JustPosted(
                            imageUrl: 'assets/icon1.png',
                            job: 'Front-End Developer',
                            company: 'Google',
                          ),
                          JustPosted(
                            imageUrl: 'assets/icon2.png',
                            job: 'UI Designer',
                            company: 'Instagram',
                          ),
                          JustPosted(
                            imageUrl: 'assets/icon3.png',
                            job: 'Data Scientist',
                            company: 'Facebook',
                          ),
                        ],
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
