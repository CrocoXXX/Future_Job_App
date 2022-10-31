import 'package:flutter/material.dart';
import 'package:future_job_app/theme.dart';

class Categories extends StatelessWidget {
  // const Categories({Key? key}) : super(key: key);

  final String imageUrl;
  final String text;

  const Categories({required this.imageUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      margin: const EdgeInsets.only(top: 16),
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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
        ),
      ),
    );
  }
}
