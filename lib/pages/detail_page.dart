import 'package:flutter/material.dart';
import 'package:future_job_app/models/job_model.dart';
import 'package:future_job_app/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  final JobModel job;
  DetailPage(this.job);

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

    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            isApplied ? applyMessage() : const SizedBox(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Image.network(
                widget.job.companyLogo,
                width: 60,
              ),
            ),
            Text(
              widget.job.name,
              style: jobDetailsStyle,
            ),
            const SizedBox(height: 2),
            Text(
              '${widget.job.companyName} • ${widget.job.location}',
              style: subDetailsStyle,
            ),
          ],
        ),
      );
    }

    Widget detailItem(String text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/dot.png',
              width: 12,
            ),
            const SizedBox(width: 8),
            Container(
              width: 340,
              child: Text(
                text,
                maxLines: 2,
                softWrap: true,
              ),
            ),
          ],
        ),
      );
    }

    Widget about() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About the job',
              style: requirementsStyle,
            ),
            Column(
              children:
                  widget.job.about.map((text) => detailItem(text)).toList(),
            ),
          ],
        ),
      );
    }

    Widget qualifications() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Qualifications',
              style: requirementsStyle,
            ),
            Column(
              children: widget.job.qualifications
                  .map((text) => detailItem(text))
                  .toList(),
            ),
          ],
        ),
      );
    }

    Widget responsibilities() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Responsibilities',
              style: requirementsStyle,
            ),
            Column(
              children: widget.job.responsibilities
                  .map((text) => detailItem(text))
                  .toList(),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  header(),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        about(),
                        qualifications(),
                        responsibilities(),
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
          ],
        ),
      ),
    );
  }
}
