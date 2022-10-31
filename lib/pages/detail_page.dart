import 'package:flutter/material.dart';
import 'package:future_job_app/theme.dart';
import 'package:future_job_app/widgets/requirements_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isApplied = true;

  @override
  Widget build(BuildContext context) {
    Widget applyButton() {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          width: 200,
          height: 45,
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
        ),
      );
    }

    Widget cancelButton() {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          width: 200,
          height: 45,
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
        ),
      );
    }

    Widget notifikasi() {
      return Container(
        width: 312,
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        decoration: BoxDecoration(
          color: const Color(0xffECEDF1),
          borderRadius: BorderRadius.circular(49),
        ),
        child: Center(
          child: Text(
            'You have applied this job and the \nrecruiter will contact you',
            style: GoogleFonts.poppins(
              color: const Color(0xffA2A6B4),
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                // const SizedBox(height: 80),
                isApplied ? const SizedBox(height: 80) : notifikasi(),
                Column(
                  children: [
                    Image.asset(
                      'assets/icon1.png',
                      width: 60,
                      height: 60,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 30),
                  child: Column(
                    children: [
                      Text(
                        'Front-End Developer',
                        style: jobDetailsStyle,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Google, Inc • Jakarta',
                        style: subDetailsStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 24, bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About the job',
                        style: requirementsStyle,
                      ),
                      const Requirements(text: 'Full-Time On Site'),
                      const Requirements(text: 'Start at \$18,000 per month'),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          'Qualifications',
                          style: requirementsStyle,
                        ),
                      ),
                      const Requirements(
                          text:
                              "Candidate must possess at least a \nBachelor's Degree."),
                      const Requirements(
                          text:
                              'Able to use Microsoft Office and Google \nbased service.'),
                      const Requirements(
                          text:
                              'Have an excellent time management, \ngood at organized and details'),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          'Responsibilities',
                          style: requirementsStyle,
                        ),
                      ),
                      const Requirements(
                          text:
                              'Initiate and promote any programs, \nevents, training, or activities.'),
                      const Requirements(
                          text:
                              'Assessing and anticipating needs and \ncollaborate with Division.'),
                    ],
                  ),
                ),
                isApplied ? applyButton() : cancelButton(),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 35),
                  child: Text(
                    'Message Recruiter',
                    style: GoogleFonts.poppins(
                      color: const Color(0xffB3B5C4),
                      fontWeight: FontWeight.w300,
                    ),
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
