import 'package:flutter/material.dart';
import 'package:future_job_app/models/category_model.dart';
import 'package:future_job_app/pages/second_homepage.dart';
import 'package:future_job_app/theme.dart';

class CategoriesCard extends StatelessWidget {
  final CategoryModel category;

  CategoriesCard(this.category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondHomePage(
              category,
            ),
          ),
        );
      },
      child: Container(
        width: 150,
        height: 200,
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(category.imageUrl),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            category.name,
            style: textCategoriesStyle,
          ),
        ),
      ),
    );
  }
}
