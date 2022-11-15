import 'package:flutter/material.dart';
import 'package:future_job_app/models/job_model.dart';
import 'package:future_job_app/pages/detail_page.dart';
import 'package:future_job_app/theme.dart';

class PostedWidget extends StatelessWidget {
  final JobModel job;

  PostedWidget(this.job);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(job),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 17),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              job.companyLogo,
              width: 45,
            ),
            const SizedBox(width: 27),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.name,
                    style: jobStyle,
                  ),
                  Text(
                    job.companyName,
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
      ),
    );
  }
}
