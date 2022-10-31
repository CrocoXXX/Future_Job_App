import 'package:flutter/material.dart';
import 'package:future_job_app/theme.dart';

class JustPosted extends StatelessWidget {
  // const JustPosted({Key? key}) : super(key: key);

  final String imageUrl;
  final String job;
  final String company;

  const JustPosted({
    required this.imageUrl,
    required this.job,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26, right: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            width: 45,
            height: 45,
          ),
          const SizedBox(width: 27),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job,
                  style: jobStyle,
                ),
                const SizedBox(height: 2),
                Text(
                  company,
                  style: companyStyle,
                ),
                const SizedBox(height: 18),
                const Divider(
                  color: Color(0xffECEDF1),
                  thickness: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
