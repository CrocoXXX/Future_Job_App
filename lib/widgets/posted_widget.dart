import 'package:flutter/material.dart';
import 'package:future_job_app/theme.dart';

class PostedWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  PostedWidget({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 17),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            width: 45,
          ),
          const SizedBox(width: 27),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: jobStyle,
                ),
                Text(
                  subtitle,
                  style: companyStyle,
                ),
                const SizedBox(height: 18),
                const Divider(
                  color: Color(0xffECEDF1),
                  thickness: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
