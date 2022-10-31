import 'package:flutter/material.dart';
import 'package:future_job_app/theme.dart';
import 'package:future_job_app/widgets/categories_widget.dart';
import 'package:future_job_app/widgets/posted_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        padding: const EdgeInsets.only(top: 30, left: 24, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Howdy',
                  style: titleStyle,
                ),
                Text(
                  'Jason Powell',
                  style: subtitleStyle,
                ),
              ],
            ),
            const Spacer(),
            Image.asset(
              'assets/user_pic.png',
              width: 58,
              height: 58,
            ),
          ],
        ),
      );
    }

    Widget body() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 24),
              child: Text(
                'Hot Categories',
                style: GoogleFonts.poppins(
                  color: blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: const [
                    Categories(
                      imageUrl: 'assets/category1.png',
                      text: 'Website Developer',
                    ),
                    SizedBox(width: 16),
                    Categories(
                      imageUrl: 'assets/category2.png',
                      text: 'Mobile Developer',
                    ),
                    SizedBox(width: 16),
                    Categories(
                      imageUrl: 'assets/category3.png',
                      text: 'App Designer',
                    ),
                    SizedBox(width: 16),
                    Categories(
                      imageUrl: 'assets/category4.png',
                      text: 'Content Writer',
                    ),
                    SizedBox(width: 16),
                    Categories(
                      imageUrl: 'assets/category5.png',
                      text: 'Video Grapher',
                    ),
                  ],
                ),
              ),
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
                    'Just Posted',
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
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(top: 20),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            unselectedItemColor: const Color(0xffB3B5C4),
            selectedItemColor: const Color(0xff272C2F),
            currentIndex: 0,
            elevation: 0,
            iconSize: 24,
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/bottom1.png'),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/bottom2.png'),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/bottom3.png'),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/bottom4.png'),
                ),
                label: '',
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                body(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
