import 'package:flutter/material.dart';
import 'package:future_job_app/models/category_model.dart';
import 'package:future_job_app/models/job_model.dart';
import 'package:future_job_app/providers/job_provider.dart';
import 'package:future_job_app/theme.dart';
import 'package:future_job_app/widgets/posted_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SecondHomePage extends StatelessWidget {
  final CategoryModel category;

  SecondHomePage(this.category);

  @override
  Widget build(BuildContext context) {
    var jobProvider = Provider.of<JobProvider>(context);

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
                        child: Image.network(
                          category.imageUrl,
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
                            category.name,
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
                      FutureBuilder<List<JobModel>>(
                        future: jobProvider.getJobsByCategory(category.name),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Column(
                              children: snapshot.data!
                                  .map(
                                    (job) => PostedWidget(
                                      job,
                                    ),
                                  )
                                  .toList(),
                            );
                          }

                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                      // PostedWidget(
                      //   imageUrl: 'assets/icon1.png',
                      //   title: 'Front-End Developer',
                      //   subtitle: 'Google',
                      // ),
                      // PostedWidget(
                      //   imageUrl: 'assets/icon2.png',
                      //   title: 'UI Designer',
                      //   subtitle: 'Instagram',
                      // ),
                      // PostedWidget(
                      //   imageUrl: 'assets/icon3.png',
                      //   title: 'Data Scientist',
                      //   subtitle: 'Facebook',
                      // ),
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
                      FutureBuilder<List<JobModel>>(
                        future: jobProvider.getJobs(),
                        builder: ((context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Column(
                              children: snapshot.data!
                                  .map(
                                    (job) => PostedWidget(
                                      job,
                                    ),
                                  )
                                  .toList(),
                            );
                          }

                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
                      ),
                      // PostedWidget(
                      //   imageUrl: 'assets/icon1.png',
                      //   title: 'Front-End Developer',
                      //   subtitle: 'Google',
                      // ),
                      // PostedWidget(
                      //   imageUrl: 'assets/icon2.png',
                      //   title: 'UI Designer',
                      //   subtitle: 'Instagram',
                      // ),
                      // PostedWidget(
                      //   imageUrl: 'assets/icon3.png',
                      //   title: 'Data Scientist',
                      //   subtitle: 'Facebook',
                      // ),
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
