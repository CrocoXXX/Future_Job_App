import 'package:flutter/material.dart';
import 'package:future_job_app/pages/second_homepage.dart';
import 'package:future_job_app/theme.dart';

class CategoriesCard extends StatelessWidget {
  final String imageUrl;
  final String text;

  CategoriesCard({required this.imageUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondHomePage(
              imageUrl: imageUrl,
              jobText: text,
            ),
          ),
        );
      },
      child: Container(
        width: 150,
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 16),
            child: Text(
              text,
              style: textCategoriesStyle,
            ),
          ),
        ),
      ),
    );
  }
}
