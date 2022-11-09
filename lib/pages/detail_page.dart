import 'package:flutter/material.dart';
import 'package:future_job_app/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isApplied = false;

  @override
  Widget build(BuildContext context) {
    Widget applyButton() {
      return Container(
        width: 200,
        height: 45,
        margin: const EdgeInsets.only(bottom: 20),
        child: TextButton(
          onPressed: () {
            setState(() {
              isApplied = !isApplied;
            });
          },
          style: TextButton.styleFrom(
            backgroundColor: purpleColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(66),
            ),
          ),
          child: Text(
            'Apply for Job',
            style: buttonStyle,
          ),
        ),
      );
    }

    Widget cancelButton() {
      return Container(
        width: 200,
        height: 45,
        margin: const EdgeInsets.only(bottom: 20),
        child: TextButton(
          onPressed: () {
            setState(() {
              isApplied = !isApplied;
            });
          },
          style: TextButton.styleFrom(
            backgroundColor: redColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(66),
            ),
          ),
          child: Text(
            'Cancel Apply',
            style: buttonStyle,
          ),
        ),
      );
    }

    Widget applyMessage() {
      return Container(
        width: 312,
        height: 60,
        margin: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          color: const Color(0xffECEDF1),
          borderRadius: BorderRadius.circular(49),
        ),
        child: Align(
          child: Text(
            'You have applied this job and the \nrecruiter will contact you',
            style: GoogleFonts.poppins(
              color: const Color(0xffA2A6B4),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Center(
                child: Column(
                  children: [
                    isApplied ? applyMessage() : const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Image.asset(
                        'assets/icon1.png',
                        width: 60,
                      ),
                    ),
                    Text(
                      'Front-End Developer',
                      style: jobDetailsStyle,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Google, Inc • Jakarta',
                      style: subDetailsStyle,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, bottom: 30, left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About the job',
                            style: requirementsStyle,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Image.asset(
                                'assets/dot.png',
                                width: 12,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Full-Time On Site',
                                style: subrequirementsStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Image.asset(
                                'assets/dot.png',
                                width: 12,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Start at \$18,000 per month",
                                style: subrequirementsStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, bottom: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Qualifications',
                            style: requirementsStyle,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Image.asset(
                                'assets/dot.png',
                                width: 12,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Candidate must possess at least a \nBachelor's Degree.",
                                style: subrequirementsStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Image.asset(
                                'assets/dot.png',
                                width: 12,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Able to use Microsoft Office and Google \nbased service.",
                                style: subrequirementsStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Image.asset(
                                'assets/dot.png',
                                width: 12,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Have an excellent time management, \ngood at organized and details",
                                style: subrequirementsStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, bottom: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Responsibilities',
                            style: requirementsStyle,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Image.asset(
                                'assets/dot.png',
                                width: 12,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Initiate and promote any programs, events, \ntraining, or activities.",
                                style: subrequirementsStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Image.asset(
                                'assets/dot.png',
                                width: 12,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Assessing and anticipating needs and \ncollaborate with Division.",
                                style: subrequirementsStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    isApplied ? cancelButton() : applyButton(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: Text(
                        'Message Recruiter',
                        style: GoogleFonts.poppins(
                          color: greyColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
