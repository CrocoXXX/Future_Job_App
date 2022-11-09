import 'package:flutter/material.dart';
import 'package:future_job_app/theme.dart';
import 'package:future_job_app/widgets/categories_card.dart';
import 'package:future_job_app/widgets/posted_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
        child: Row(
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
            ),
          ],
        ),
      );
    }

    Widget body() {
      return Container(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Hot Categories',
                style: GoogleFonts.poppins(
                  color: blackColor,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    CategoriesCard(
                      imageUrl: 'assets/category1.png',
                      text: 'Website Developer',
                    ),
                    const SizedBox(width: 16),
                    CategoriesCard(
                      imageUrl: 'assets/category2.png',
                      text: 'Mobile Developer',
                    ),
                    const SizedBox(width: 16),
                    CategoriesCard(
                      imageUrl: 'assets/category3.png',
                      text: 'App Designer',
                    ),
                    const SizedBox(width: 16),
                    CategoriesCard(
                      imageUrl: 'assets/category4.png',
                      text: 'Content Writer',
                    ),
                    const SizedBox(width: 16),
                    CategoriesCard(
                      imageUrl: 'assets/category5.png',
                      text: 'Video Grapher',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Just Posted',
                    style: GoogleFonts.poppins(
                      color: blackColor,
                      fontSize: 16,
                    ),
                  ),
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
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(top: 30),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            selectedItemColor: const Color(0xff272C2F),
            unselectedItemColor: const Color(0xffB3B5C4),
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
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              body(),
            ],
          ),
        ),
      ),
    );
  }
}
